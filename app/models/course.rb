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

  def average_ratings
    average = feedbacks.sum(&:rating).fdiv(feedbacks.count)
    if average.nan?
      return 0
    else
      return round_to_half(average)
    end
  end

  def show_stars
      a = average_ratings.divmod 1
      full_stars = a[0]
      half_stars = (a[1] * 2).to_i
      empty_stars = 5 - full_stars - half_stars
      return [full_stars, half_stars, empty_stars]
    end

  def round_to_half(float)
    (float * 2.0).round / 2.0
  end

end
