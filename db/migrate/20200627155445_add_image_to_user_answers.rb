class AddImageToUserAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :user_answers, :image, :boolean,  default: false
  end
end
