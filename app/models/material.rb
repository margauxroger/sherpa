class Material < ApplicationRecord
  has_many :courses
  has_many :divisions, through: :courses
  has_many :chapters
  has_many :flashcards, through: :chapters
end
