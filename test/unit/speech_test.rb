# == Schema Information
#
# Table name: speeches
#
#  id          :integer         not null, primary key
#  user_id     :integer         not null
#  language_id :integer         not null
#  level       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'test_helper'

class SpeechTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
