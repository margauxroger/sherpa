class CreateSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :suggestions do |t|
      t.string :type
      t.string :content
      t.references :user, foreign_key: true
      t.references :teacher_division, foreign_key: true

      t.timestamps
    end
  end
end
