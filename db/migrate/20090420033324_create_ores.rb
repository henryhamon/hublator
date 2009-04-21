class CreateOres < ActiveRecord::Migration
  def self.up
    create_table :ores do |t|
      t.string :url
      t.text :description
      t.string :title
      t.string :home_url

      t.timestamps
    end
  end

  def self.down
    drop_table :ores
  end
end
