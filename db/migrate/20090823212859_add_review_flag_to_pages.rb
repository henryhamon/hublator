class AddReviewFlagToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :is_review, :boolean, :default => false
  end

  def self.down
    remove_column :pages, :is_review
  end

end

