# == Schema Information
#
# Table name: interpreters
#
#  id               :integer         not null, primary key
#  user_id          :integer         not null
#  page_id          :integer         not null
#  kind             :string(255)     not null
#  user_consistency :boolean
#  user_translation :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

class Interpreter < ActiveRecord::Base

  validates_presence_of :user, :page, :kind

  belongs_to :user
  belongs_to :page

  named_scope :positive_consistency, :conditions => ['user_consistency = ?', true]
  named_scope :negative_consistency, :conditions => ['user_consistency = ?', false]
  named_scope :positive_translation, :conditions => ['user_translation = ?', true]
  named_scope :negative_translation, :conditions => ['user_translation = ?', false]

  after_create :create_feed

  private

  def create_feed
    Activity.create!(:streamable => self, :action => 'create', :user => self.user)
  end

end

