class CreateCrumbs < ActiveRecord::Migration
  def self.up
    create_table :crumbs do |t|
      t.string :route
      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :crumbs
  end
end
