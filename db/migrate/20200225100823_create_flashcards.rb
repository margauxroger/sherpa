class CreateFlashcards < ActiveRecord::Migration[5.2]
  def change
    create_table :flashcards do |t|
      t.text :question
      t.text :answer
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
