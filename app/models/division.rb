class Division < ApplicationRecord
  has_many :teacher_divisions
  has_many :users
  has_many :courses
  has_many :forums, through: :courses
end
