# == Schema Information
#
# Table name: addresses
#
#  id         :integer(4)      not null, primary key
#  street     :string(255)
#  number     :integer(4)
#  district   :string(255)
#  city_id    :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
