# == Schema Information
#
# Table name: projects
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

describe Project do

  before do
    @project = Factory.create(:project)
  end
  
  should_validate_presence_of :name
  should_validate_presence_of :category
  should_validate_presence_of :description
  should_validate_presence_of :user
  
end
