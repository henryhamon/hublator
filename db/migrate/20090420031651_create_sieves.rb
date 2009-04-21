class CreateSieves < ActiveRecord::Migration
  def self.up
    create_table :sieves do |t|
      t.string :name
      t.text :description
      t.string :title
      t.string :home_url

      t.timestamps
    end
  end

  def self.down
    drop_table :sieves
  end
end
