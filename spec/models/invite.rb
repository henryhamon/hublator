require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Invite do

  before do
    @invite = Factory.create(:invite)
  end
  
  should_validate_presence_of :project
  should_validate_presence_of :language
  should_validate_presence_of :user

  should_belong_to :user
  should_belong_to :project
  should_belong_to :language
  
end
