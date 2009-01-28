class Users < ActiveRecord::Migration
	
  def self.up
    create_table "users", :force => true do |t|
      t.integer :twitter_id
      t.integer :hp, :default => 10000
      t.integer :xp, :default => 0
      t.references :level
      t.string :guild
      t.timestamps
    end
    add_index :users, :twitter_id, :unique => true
  end

  def self.down
    drop_table "users"
  end
end
