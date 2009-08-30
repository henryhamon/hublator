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

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Activity do

  before do
    @activity = Factory.create(:activity)
  end
  
  should_validate_presence_of :streamable
  should_validate_presence_of :action

  should_belong_to :streamable, :polymorphic => true
  
end
