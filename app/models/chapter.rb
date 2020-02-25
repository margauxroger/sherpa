class Chapter < ApplicationRecord
  belongs_to :material
  has_many :flashcards
end
