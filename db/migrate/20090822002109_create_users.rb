class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :url
      t.string :country
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :single_access_token
      t.string :perishable_token
      t.string :openid_identifier
      t.boolean :admin, :default => false

      t.timestamps
    end

    add_index :users, :login
    add_index :users, :email
  end

  def self.down
    drop_table :users
  end
end

