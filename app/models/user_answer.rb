class UserAnswer < ApplicationRecord
  belongs_to :session
  belongs_to :flashcard
end
