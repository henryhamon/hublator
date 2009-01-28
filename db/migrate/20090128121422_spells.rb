class Spells < ActiveRecord::Migration
  def self.up
    create_table "spells", :force => true do |t|
      t.string :name, :limit => 40
      t.integer :spell_type
      t.integer :damage
      t.references :level
      t.integer :max_level
      t.integer :min_level
    end
    add_index :spells, :name, :unique => true
  end

  def self.down
    drop_table "spells"
  end
end
