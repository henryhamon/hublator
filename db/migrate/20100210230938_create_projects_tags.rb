class CreateProjectsTags < ActiveRecord::Migration
  def self.up
   create_table :projects_tags do |t|
     t.references :project
     t.references :tag
   end
  end

  def self.down
    drop_table :projects_tags
  end
end
