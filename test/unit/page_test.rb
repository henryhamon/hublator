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

require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
