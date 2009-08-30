# == Schema Information
#
# Table name: pages
#
#  id          :integer         not null, primary key
#  project_id  :integer         not null
#  language_id :integer         not null
#  parent_id   :integer
#  page_number :integer         not null
#  content     :text
#  finished    :boolean
#  status      :string(255)     default("released")
#  created_at  :datetime
#  updated_at  :datetime
#

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe Page do

  before do
    @page = Factory.create(:page)
  end
  
  should_validate_presence_of :project
  should_validate_presence_of :language
  should_validate_presence_of :page_number

  should_belong_to :project
  should_belong_to :language
  
end
