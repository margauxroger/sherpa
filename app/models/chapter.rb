 class Chapter < ApplicationRecord
  belongs_to :material
  has_many :flashcards, dependent: :destroy
  has_many :sessions

  validates :name, presence: true
  validates :content, presence: true

  def flashcards_number
    self.flashcards.length
  end

  def find_flashcards_answers_by_student(student)
    student_flashcards = []
    self.flashcards.each do |flashcard|
      flashcard.user_answers.where("user_id = ?", student.id).each do |student_flashcard|
        student_flashcards << student_flashcard
        # p flashcard
      end
    end
    student_flashcards
  end


  # A SUPPRIMER ?
  def score_chapter(students_number)
    score = 0
    self.flashcards.each do |flashcard|
      flashcard.user_answers.each do |user_answer|
        score += user_answer.completion
      end
    end
    score.fdiv(self.flashcards_number).fdiv(students_number).round(2)*100
  end

  # POUR REMPLACER
  def score_div(division)
    division.users.map { |student| student.flashcards_score(self) }.sum.fdiv(flashcards_number)
  end
end
