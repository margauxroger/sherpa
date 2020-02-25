class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :flashcard

  validates :student_answer, presence: true
end
