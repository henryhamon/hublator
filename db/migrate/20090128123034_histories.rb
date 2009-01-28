class Histories < ActiveRecord::Migration

  def self.up
    create_table "histories", :force => true do |t|
      t.integer :user_receved
      t.integer :user_attack
      t.references :spell
      t.timestamps
    end
  end

  def self.down
    drop_table "histories"
  end
end
