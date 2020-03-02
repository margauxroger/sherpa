class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :type, presence: true,
                   inclusion: { in: ['flashcards', 'feeling', 'message', 'feedback'] },
                   uniqueness: { scope: :course_id }

  validates :content, presence: true
end
