class UserAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :flashcard

  STATUSES = ["not mastered", "learning", "mastered"]
  # validates :status, presence: true, inclusion: { in: STATUSES }


  def completion
    if self.status == "mastered"
      return 1
    elsif self.status == "learning"
      return 0.5
    else
      return 0
    end
  end
end
