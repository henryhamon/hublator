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

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Interpreter do

  before do
    @interpreter = Factory.create(:interpreter)
  end
  
  should_validate_presence_of :user
  should_validate_presence_of :page
  should_validate_presence_of :kind

  should_belong_to :user
  should_belong_to :page
  
end
