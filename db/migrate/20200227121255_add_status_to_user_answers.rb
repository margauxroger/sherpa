class AddStatusToUserAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :user_answers, :status, :string
  end
end
