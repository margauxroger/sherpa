class ChangeSuggestionsName < ActiveRecord::Migration[5.2]
  def change
    rename_table :suggestions, :notifications
  end
end
