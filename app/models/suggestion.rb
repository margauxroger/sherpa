class Suggestion < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :type, presence: true, inclusion: { in: ['Deadline', 'Student warning', 'Class warning'] }
  validates :content, presence: true
end
