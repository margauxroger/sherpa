class CreateUserAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_answers do |t|
      t.text :answer_student
      t.references :user, foreign_key: true
      t.references :flashcard, foreign_key: true

      t.timestamps
    end
  end
end
