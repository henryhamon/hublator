class Levels < ActiveRecord::Migration
  def self.up
    create_table "levels", :force => true do |t|
      t.integer :level
      t.integer :need_xp
      t.integer :hp_received
    end
    add_index :levels, :level, :unique => true
  end

  def self.down
    drop_table "levels"
  end
end
