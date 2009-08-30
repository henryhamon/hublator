class ChangeDefaultProjectStatus < ActiveRecord::Migration
  def self.up
    change_column(:projects, :status, :string, :default => 'pending')
  end

  def self.down
    change_column(:projects, :status, :string, :default => 'processed')
  end
end

