class CreateTranslations < ActiveRecord::Migration
  def self.up
    create_table :translations do |t|
      t.references :project, :null => false
      t.references :language, :null => false
      t.string :type

      t.timestamps
    end

    add_index :translations, :language_id
    add_index :translations, :project_id
  end

  def self.down
    drop_table :translations
  end
end

