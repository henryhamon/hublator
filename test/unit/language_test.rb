# == Schema Information
#
# Table name: languages
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
