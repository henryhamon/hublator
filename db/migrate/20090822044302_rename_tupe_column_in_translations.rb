class RenameTupeColumnInTranslations < ActiveRecord::Migration
  def self.up
    change_table :translations do |t|
      t.rename :type, :project_type
    end
  end

  def self.down
    change_table :translations do |t|
      t.rename :project_type, :type
    end
  end
end
