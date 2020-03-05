class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :messages, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :divisions, through: :courses
  has_many :materials, through: :courses
  has_many :feedbacks, through: :courses
  has_many :sessions, dependent: :destroy
  has_many :suggestions
  has_many :feedbacks
  belongs_to :division, optional: true

  validates :role, inclusion: { in: %w[teacher student admin] }

  # require 'facets/math/percentile'

  def teacher?
    role == "teacher"
  end

  def student?
    role == "student"
  end

  def courses
    self.divisions.map(&:courses).flatten
  end

  def score(material)
    chapter_scores = material.chapters.map { |chapter| flashcards_score(chapter) }
    chapter_scores.sum.fdiv(chapter_scores.length).round(2)
  end

  def sentiment_score(course)
    Feedback.where(user_id: self.id).where(course_id: course.id).first.sentiment_score
    # self.feedbacks.map { |feedback| feedback.sentiment_score }
  end

  def flashcards_score(chapter)
    last_session = Session.where(chapter_id: chapter.id).where(user_id: self.id).last
    return last_session.nil? ? 0 : last_session.score
  end

  def flashcards_score_student(material)
    score = {}
    material.chapters.each { |chapter| score[chapter.name] = flashcards_score(chapter) }
    return score
  end

  def border_color(material)
    return "red-border"     if self.score(material) < 45
    return "orange-border"  if self.score(material) < 65
    "green-border"
  end

  def flashcards_notifications
    Notification.where(notif_type: "flashcards").where(user_id: self.id).to_a.each { |notification| notification.destroy }
    Course.where("user_id = ?", self.id).each do |course|
      student_flashcard_scores = course.users.map { |student| student.score(course.material) }
      outlier_criteria = calculate_percentile(student_flashcard_scores, 0.25) - 1.5 * (calculate_percentile(student_flashcard_scores, 0.75) - calculate_percentile(student_flashcard_scores, 0.25))
      if outlier_criteria == 0
        warning_students = course.users
      else
        warning_students = course.users.select { |student| student.score(course.material) < 50.0 }
      end
      unless warning_students.nil? || warning_students.empty?
        Notification.create(notif_type: "flashcards",
                               content: "#{warning_students.length} student#{"s" if warning_students.length > 1}
                                          lagging behind for #{course.material.name}",
                             course_id: course.id,
                               user_id: self.id)
      end
    end
  end

  def feeling_notifications
    Course.where("user_id = ?", self.id).each do |course|
      warning_students = course.users.select { |student| student.score(course.material) < 50.0 }
      unless warning_students.empty?
        Notification.create(notif_type: "feeling",
                               content: "#{warning_students.length} student#{"s" if warning_students.length > 1}
                                          ha#{warning_students.length > 1 ? "ve" : "s"} a sentiment score below 50%
                                          regarding the course #{course.material.name}",
                             course_id: course.id,
                               user_id: self.id)
      end
    end
  end

  def count_unread_notifications
    Notification.where("user_id = ?", self.id).where(read_status: false).length
  end

  private

  def calculate_percentile(array = [], percentile = 0.0)
    array.empty? ? 0 : array.sort[((array.length * percentile).ceil) - 1]
  end
end
