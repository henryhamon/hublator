# == Schema Information
#
# Table name: translations
#
#  id           :integer         not null, primary key
#  project_id   :integer         not null
#  language_id  :integer         not null
#  project_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Translation do

  before do
    @translation = Factory.create(:translation)
  end
  
  should_validate_presence_of :project
  should_validate_presence_of :language
  should_validate_presence_of :project_type

  should_belong_to :project
  should_belong_to :language
  
end
