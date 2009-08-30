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

class Translation < ActiveRecord::Base

# validates_presence_of :project, :language, :project_type

  belongs_to :project
  belongs_to :language

end

