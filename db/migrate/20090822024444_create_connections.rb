class CreateConnections < ActiveRecord::Migration
  def self.up
    create_table :connections do |t|
      t.references :user, :null => false
      t.integer :contact_id, :null => false #self join, para marcar seguidor
      t.timestamps

    end

    add_index :connections, :user_id
    add_index :connections, :contact_id
  end

  def self.down
    drop_table :connections
  end
end

