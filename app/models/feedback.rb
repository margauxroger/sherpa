class Feedback < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :comment, presence: true
  validates :rating, presence: true, numericality: { only_integer: true,
                                                     greater_than_or_equal_to: 0,
                                                     less_than_or_equal_to: 5
                                                     }
  validates :course_id, uniqueness: { scope: :user_id }
end
