class CreateDefaultLanguages < ActiveRecord::Migration
  def self.up
    date = Time.new.strftime('%Y-%m-%d %H:%M:%S')
    Language.create!(:name => 'English' , :abbr => 'en', :created_at => date, :updated_at => date)
    Language.create!(:name => 'Spanish' , :abbr => 'es', :created_at => date, :updated_at => date)
    Language.create!(:name => 'Portuguese' , :abbr => 'pt_BR', :created_at => date, :updated_at => date)
  end

  def self.down
  end
end

