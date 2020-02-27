class Division < ApplicationRecord
  has_many :users
  has_many :courses
  has_many :forums, through: :courses

  validates :name, presence: true
  validates :level, presence: true
end
