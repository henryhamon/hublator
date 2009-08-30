class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :name
      t.string :abbr

      t.timestamps
    end
    add_index :languages, :abbr

  end

  def self.down
    drop_table :languages
  end
end

