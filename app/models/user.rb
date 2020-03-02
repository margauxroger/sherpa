class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :messages, dependent: :destroy
  has_many :user_answers, dependent: :destroy
  has_many :courses
  has_many :divisions, through: :courses
  has_many :materials, through: :courses
  has_many :suggestions
  belongs_to :division, optional: true

  validates :role, inclusion: { in: %w[teacher student admin] }




  def teacher?
    role == "teacher"
  end

  def courses
    self.divisions.map(&:courses).flatten
  end

  def score(material)
    chapter_scores = material.chapters.map { |chapter| flashcards_score(chapter) }
    chapter_scores.sum.fdiv(chapter_scores.length).round(2)
  end

  def find_flashcards_answers(chapter)
    chapter.find_flashcards_answers_by_student(self)
  end

  def flashcards_score(chapter)
    student_flashcards = find_flashcards_answers(chapter)
    score = student_flashcards.map {|student_flashcard| student_flashcard.completion }.sum
    score.fdiv(chapter.flashcards_number).round(2)*100
  end

  def border_color(material)
    return "red-border"     if self.score(material) < 45
    return "orange-border"  if self.score(material) < 65
    "green-border"
  end


end
