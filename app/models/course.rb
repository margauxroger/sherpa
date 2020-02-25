class Course < ApplicationRecord
  belongs_to :division
  belongs_to :material
  has_many :forums
  has_many :feedbacks
end
