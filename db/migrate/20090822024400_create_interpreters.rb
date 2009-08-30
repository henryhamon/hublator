class CreateInterpreters < ActiveRecord::Migration
  def self.up
    create_table :interpreters do |t|
      t.references :user, :null => false
      t.references :page, :null => false
      t.string :kind, :null => false #autor, tradutor, revisor
      t.boolean :user_consistency, :default => false
      t.boolean :user_translation, :default => false
      t.timestamps
    end

    add_index :interpreters, :user_id
    add_index :interpreters, :page_id
  end

  def self.down
    drop_table :interpreters
  end
end

