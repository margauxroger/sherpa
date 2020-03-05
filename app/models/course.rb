class Course < ApplicationRecord
  belongs_to :division
  belongs_to :material
  belongs_to :user

  has_many :feedbacks, dependent: :destroy
  has_many :users, through: :division
  has_many :notifications, dependent: :destroy

  def division_score
    score = []
    self.division.users.each do |student|
      score << student.score(self.material)
    end
    score.sum.fdiv(score.length).round(2)
  end
end
