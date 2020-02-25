class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.text :comment
      t.integer :rating
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end
