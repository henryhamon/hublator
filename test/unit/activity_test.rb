# == Schema Information
#
# Table name: activities
#
#  id              :integer         not null, primary key
#  streamable_id   :integer
#  streamable_type :string(255)
#  action          :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
