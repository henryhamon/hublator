# == Schema Information
#
# Table name: cities
#
#  id       :integer(4)      not null, primary key
#  state_id :integer(4)      default(0), not null
#  name     :string(50)      default(""), not null
#

require 'test_helper'

class CityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
