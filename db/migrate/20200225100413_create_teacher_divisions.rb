class CreateTeacherDivisions < ActiveRecord::Migration[5.2]
  def change
    create_table :teacher_divisions do |t|
      t.references :user, foreign_key: true
      t.references :division, foreign_key: true

      t.timestamps
    end
  end
end
