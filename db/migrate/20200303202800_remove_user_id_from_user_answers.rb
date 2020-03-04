class RemoveUserIdFromUserAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :user_answers, :user
  end
end
