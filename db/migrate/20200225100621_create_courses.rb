class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.references :division, foreign_key: true
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
