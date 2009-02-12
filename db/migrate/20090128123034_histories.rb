class Histories < ActiveRecord::Migration

  def self.up
    create_table "histories", :force => true do |t|
      t.integer :title
      t.integer :content
      t.timestamps
    end
  end

  def self.down
    drop_table "histories"
  end
end
