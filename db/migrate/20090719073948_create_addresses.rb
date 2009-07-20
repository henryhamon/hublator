class CreateAddresses < ActiveRecord::Migration

  def self.up
    create_table :addresses do |t|

      t.string :street
      t.integer :number
      t.string :district
      t.references :city
      t.references :user
      t.timestamps
    end

    add_foreign_key(:addresses, :users)
    add_foreign_key(:addresses, :cities)

    add_index :addresses, :street
    add_index :addresses, :district
    add_index :addresses, :city_id

  end

  def self.down
    drop_table :addresses
  end
end
