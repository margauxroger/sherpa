class AddImageToFlashcards < ActiveRecord::Migration[5.2]
  def change
    add_column :flashcards, :image, :string
  end
end
