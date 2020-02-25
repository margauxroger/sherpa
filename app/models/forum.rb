class Forum < ApplicationRecord
  belongs_to :course
  has_many :messages
  has_many :users, through: :messages
end
