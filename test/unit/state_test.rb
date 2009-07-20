# == Schema Information
#
# Table name: states
#
#  id          :integer(4)      not null, primary key
#  abreviation :string(10)      default(""), not null
#  name        :string(20)      default(""), not null
#

require 'test_helper'

class StateTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
