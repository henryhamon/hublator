class CreateActivities < ActiveRecord::Migration
  def self.up
    create_table :activities do |t|
      t.references :streamable, :polymorphic => true
      t.references :user, :null => false
      t.string :action #create, delete
      t.timestamps
    end

    add_index :activities, :streamable_id
    add_index :activities, :streamable_type
    add_index :activities, :user_id
  end

  def self.down
    drop_table :activities
  end
end

