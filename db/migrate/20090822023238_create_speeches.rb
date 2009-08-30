class CreateSpeeches < ActiveRecord::Migration
  def self.up
    create_table :speeches do |t|
      t.references :user, :null => false
      t.references :language, :null => false
      t.string :level

      t.timestamps
    end

    add_index :speeches, :language_id
  end

  def self.down
    drop_table :speeches
  end
end

