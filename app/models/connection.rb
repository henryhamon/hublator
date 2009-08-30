# == Schema Information
#
# Table name: connections
#
#  id         :integer         not null, primary key
#  user_id    :integer         not null
#  contact_id :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

class Connection < ActiveRecord::Base

  #validates_presence_of :user, :contact

  belongs_to :user
  belongs_to :contact, :class_name => "User", :foreign_key => "contact_id"

  has_many :activities, :as => :streamable, :dependent => :destroy

  after_create :create_feed

  private
  def create_feed
    Activity.create!(:streamable => self, :action => 'create', :user => self.user)
  end

end

