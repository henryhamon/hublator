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

require 'test_helper'

class ConnectionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
