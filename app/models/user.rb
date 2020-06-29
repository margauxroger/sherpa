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

  def full_name
    "#{self.first_name.capitalize} #{self.last_name.capitalize}"
  end

  def courses
    self.divisions.map(&:courses).flatten
  end

  # -----------------------Scoring methods-------------------------

  def score(material)
    # recuperer le scores hash
    # selectionner les keys qui correspondent a un chapitre du material
    material_chapter_ids = material.chapter_ids
    grades = self.scores.slice(*material_chapter_ids).values.map(&:to_i)
    return grades.sum / grades.length
    # chapter_scores = material.chapters.map { |chapter| flashcards_score(chapter) }
    # self.grade = (chapter_scores.sum / material.flashcards_number) * 100
  end

  # def grade
  #   output = {}
  #   self.division.courses.each do |course|
  #     output[course.material.name] = score(course.material)
  #   end
  #   return output
  # end

  def sentiment_score(course)
    Feedback.where(user_id: self.id).where(course_id: course.id).first.sentiment_score
    # self.feedbacks.map { |feedback| feedback.sentiment_score }
  end

  def flashcards_score(chapter)
    # last_session = Session.where(chapter_id: chapter.id).where(user_id: self.id).last
    # return last_session.nil? ? 0 : last_session.score
    return self.scores[chapter.id.to_s].nil? ? 0 : self.scores[chapter.id.to_s].to_i
  end

  # TODO : change computation here so that we use the scores hash
  def flashcards_score_student(material)
    score = {}
    material.chapters.each { |chapter| score[chapter.name] = flashcards_score(chapter) }
    return score
  end

  # ----------------------------------------------------------------

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
      warning_students = course.users.select { |student| student.feedbacks.where(course_id: course.id).first.sentiment_score < 50.0 }
      unless warning_students.empty?
        Notification.create(notif_type: "feeling",
                               content: "#{warning_students.length} student#{"s" if warning_students.length > 1}
                                          ha#{warning_students.length > 1 ? "ve" : "s"} a sentiment score below 50%
                                          regarding #{course.material.name}",
                             course_id: course.id,
                               user_id: self.id)
      end
    end
  end

  def count_unread_notifications
    Notification.where("user_id = ?", self.id).where(read_status: false).length
  end

  def left_a_feedback?(course)
    self.feedbacks.where(course_id: course.id).any?
  end

  def cluster_message_student(course)
    cluster_of_student = ""
    if self.grade >= 65 && self.sentiment_score(course) >= 50
      cluster_of_student = "#{self.first_name} is performing well and really enjoy the course."
    elsif self.grade >= 65  && self.sentiment_score(course) < 50
      cluster_of_student = "#{self.first_name} is performing well and does not enjoy the course that much."
    elsif self.grade < 65  && self.sentiment_score(course)  >= 50
      cluster_of_student = "#{self.first_name} is not performing well but really enjoy the course."
    else
      cluster_of_student = "#{self.first_name} is not performing well and does not enjoy the course that much."
    end
    return cluster_of_student
  end

  # def color_student(material,course)
  #     student_sentiment_score_flashcards_score[self.id] = {}
  #     if self.score(material) >= 65 && self.sentiment_score(course) >= 50
  #       student_sentiment_score_flashcards_score[self.id] = { x: score , y: sentiment, color: "green" }

  #     elsif self.score(material) >= 65 && self.sentiment_score(course) < 50
  #       student_sentiment_score_flashcards_score[self.id] = { x: score , y: sentiment, color: "blue" }

  #     elsif self.score(material) < 65 && self.sentiment_score(course) >= 50
  #       student_sentiment_score_flashcards_score[self.id] = { x: score , y: sentiment, color: "purple" }

  #     else student_sentiment_score_flashcards_score[self.id] = { x: score , y: sentiment, color: "red" }
  #     end

  #   end
  # end

  def save_session_score(session)
    self.scores[session.chapter_id.to_s] = session.score / session.flashcards.length * 100
  end

  def save_session_memory(session)
    latest_memory = session.memory_type
    # essayer de weighter pour donner plus de poid à la derniere session
    if self.memory == {}
      self.memory["image"] = latest_memory[:image]
      self.memory["text"] = latest_memory[:text]
    else
      self.memory["image"] = (self.memory["image"].to_f + latest_memory[:image]) / 2
      self.memory["text"] = (self.memory["text"].to_f + latest_memory[:text]) / 2
    end
  end

  private

  def calculate_percentile(array = [], percentile = 0.0)
    array.empty? ? 0 : array.sort[((array.length * percentile).ceil) - 1]
  end

end
