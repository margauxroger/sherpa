class AddMemoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :memory, :boolean,  default: false
  end
end
