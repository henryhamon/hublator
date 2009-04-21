class FixSieves < ActiveRecord::Migration
  def self.up
    remove_column :sieves, :description
    remove_column :sieves, :title
    remove_column :sieves, :home_url
  end

  def self.down
    remove_column :sieves, :description, :text
    remove_column :sieves, :title, :string
    remove_column :sieves, :home_url, :string
  end
end
