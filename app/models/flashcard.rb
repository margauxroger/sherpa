class Flashcard < ApplicationRecord
  belongs_to :chapter
  has_many :user_answers
  has_many :users, through: :user_answers
end
