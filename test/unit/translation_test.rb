# == Schema Information
#
# Table name: translations
#
#  id           :integer         not null, primary key
#  project_id   :integer         not null
#  language_id  :integer         not null
#  project_type :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

require 'test_helper'

class TranslationTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
