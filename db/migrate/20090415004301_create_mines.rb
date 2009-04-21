class CreateMines < ActiveRecord::Migration
  def self.up
    create_table :mines do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :mines
  end
end
