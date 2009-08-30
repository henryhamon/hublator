# == Schema Information
#
# Table name: speeches
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  language_id :integer         not null
#  level       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Speech do

  before do
    @speech = Factory.create(:speech)
  end
  
  should_validate_presence_of :user
  should_validate_presence_of :language
  should_validate_presence_of :level

  should_belong_to :user
  should_belong_to :language
  
end
