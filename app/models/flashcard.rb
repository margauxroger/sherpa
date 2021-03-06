class Flashcard < ApplicationRecord
  belongs_to :chapter
  has_many :user_answers, dependent: :destroy
  has_many :users, through: :user_answers

  validates :question, presence: true
  validates :answer, presence: true
end
