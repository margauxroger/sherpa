class AddMemoryToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :memory, :hstore,  default: {}
  end
end
