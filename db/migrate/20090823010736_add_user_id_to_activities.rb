class AddUserIdToActivities < ActiveRecord::Migration
  def self.up
    add_column :activities, :user_id, :integer
    add_index :activities, :user_id
  end

  def self.down
    remove_column :activities, :user_id
  end
end

