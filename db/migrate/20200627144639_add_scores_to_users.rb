class AddScoresToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :scores, :hstore, default: {}
  end
end
