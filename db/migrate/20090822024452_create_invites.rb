class CreateInvites < ActiveRecord::Migration
  def self.up
    create_table :invites do |t|
      t.references :project, :null => false
      t.references :language, :null => false
      t.references :user, :null => false
      t.boolean :read, :default => false
      t.timestamps
    end

    add_index :invites, :project_id
    add_index :invites, :language_id
    add_index :invites, :user_id
  end

  def self.down
    drop_table :invites
  end
end

