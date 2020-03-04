class AddOutputToUserAnswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :user_answers, :status, :string
    add_column :user_answers, :output, :boolean, default: false
  end
end
