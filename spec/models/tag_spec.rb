# == Schema Information
#
# Table name: tags
#
#  id                      :integer         not null, primary key
#  name                    :string(255)
#  category                :string(255)
#  url                     :string(255)
#  description             :text
#  user_id                 :integer         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  status                  :string(255)     default("pending")
#  created_at              :datetime
#  updated_at              :datetime
#

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Tag do

  before do
    @tag = Factory.create(:tag)
  end
  
  should_validate_presence_of :name

  describe 'Name should be downcase' do
    @tag = Tag.create(:name => 'Tolkien')
    @tag.name should 'tolkien'

  end
  
end
