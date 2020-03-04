class Material < ApplicationRecord
  has_many :courses
  has_many :divisions, through: :courses
  has_many :users, through: :courses, source: :user
  has_many :chapters
  has_many :flashcards, through: :chapters

  validates :name, presence: true
  validates :category, presence: true

  def flashcards_number
    self.chapters.map { |chapter| chapter.flashcards_number }.sum
  end
end
