class Course < ApplicationRecord
  belongs_to :division
  belongs_to :material
  belongs_to :user

  has_one :forum

  has_many :feedbacks
  has_many :users, through: :division

  def division_score
    score = []
    self.division.users.each do |student|
      score << student.score(self.material)
    end
    score.sum.fdiv(score.length).round(2)
  end
end
