class RemoveUserIdFromActivities < ActiveRecord::Migration
  def self.up
    remove_column :activities, :user_id
  end

  def self.down
    add_column :activities, :user_id, :integer
  end
end
