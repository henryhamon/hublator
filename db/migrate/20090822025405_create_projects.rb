class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :category #artigo, livro
      t.string :url
      t.text :description
      t.references :user, :null => false
      t.string :attachment_file_name
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.datetime :attachment_updated_at
      t.string :status, :default => 'processed' #aasm arquivo em espera, arquivo processado      t.timestamps

      t.timestamps
    end

    add_index :projects, :user_id
  end

  def self.down
    drop_table :projects
  end
end

