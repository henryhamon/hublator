class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.references :project, :null => false
      t.references :language, :null => false
      t.integer :parent_id #self join, para marcar a pagina pai
      t.integer :page_number, :null => false
      t.text :content
      t.boolean :finished #se foi finalizada
      t.string :status, :default => 'released' #aasm se pode traduzir
      t.timestamps
    end

    add_index :pages, :project_id
    add_index :pages, :language_id
    add_index :pages, :parent_id
  end

  def self.down
    drop_table :pages
  end
end

