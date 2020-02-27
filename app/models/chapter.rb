class Chapter < ApplicationRecord
  belongs_to :material
  has_many :flashcards

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
      end
    end
  end

end
