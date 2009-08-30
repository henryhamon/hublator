# == Schema Information
#
# Table name: interpreters
#
#  id               :integer         not null, primary key
#  user_id          :integer         not null
#  page_id          :integer         not null
#  kind             :string(255)     not null
#  user_consistency :boolean
#  user_translation :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

require 'test_helper'

class InterpreterTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
