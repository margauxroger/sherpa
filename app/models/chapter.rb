class Chapter < ApplicationRecord
  belongs_to :material
  has_many :flashcards

  validates :name, presence: true
  validates :content, presence: true

end
