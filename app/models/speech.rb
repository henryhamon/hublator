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

class Speech < ActiveRecord::Base

  belongs_to :user
  belongs_to :language

  validates_presence_of :user, :language, :level

end

