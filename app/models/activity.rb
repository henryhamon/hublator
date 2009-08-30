# == Schema Information
#
# Table name: activities
#
#  id              :integer         not null, primary key
#  streamable_id   :integer
#  streamable_type :string(255)
#  action          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#

class Activity < ActiveRecord::Base

  validates_presence_of :streamable, :action

  belongs_to :streamable, :polymorphic => true
  belongs_to :user

  def nested
    self.streamable_type.constantize.find(self.streamable_id)
  end

end

