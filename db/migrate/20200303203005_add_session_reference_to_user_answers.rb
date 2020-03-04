class AddSessionReferenceToUserAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_answers, :session
  end
end
