class RenameTypeInNotifications < ActiveRecord::Migration[5.2]
  def change
    rename_column :notifications, :type, :notif_type
  end
end
