class AddGradeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :grade, :integer, default: 0
  end
end
