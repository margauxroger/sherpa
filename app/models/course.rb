class Course < ApplicationRecord
  belongs_to :division
  belongs_to :material
  belongs_to :user

  has_many :feedbacks
  has_many :users, through: :division
end
