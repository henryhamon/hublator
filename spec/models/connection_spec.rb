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

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Connection do

  before do
    @connection = Factory.create(:connection)
  end
  
  should_validate_presence_of :user
  should_validate_presence_of :contact

  should_belong_to :user
  should_belong_to :contact
  
end
