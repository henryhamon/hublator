# == Schema Information
#
# Table name: languages
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Language do

  before do
    @language = Factory.create(:language)
  end
  
  should_validate_presence_of :name
  should_validate_presence_of :abbr
  
end
