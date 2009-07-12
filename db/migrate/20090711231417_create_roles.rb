class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.timestamps
    end

  Role.create(:name => 'admin', :description => 'super user')
  Role.create(:name => 'manager', :description => "institution's manager")
  Role.create(:name => 'director', :description => "unit's director")
  Role.create(:name => 'teacher', :description => "teacher")
  Role.create(:name => 'student', :description => "student")

  end


  def self.down
    drop_table :roles
  end
end
