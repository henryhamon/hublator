# == Schema Information
#
# Table name: invites
#
#  id          :integer         not null, primary key
#  project_id  :integer         not null
#  language_id :integer         not null
#  user_id     :integer         not null
#  read        :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Invite < ActiveRecord::Base

  validates_presence_of :user, :language, :project
  
  belongs_to :user
  belongs_to :project
  belongs_to :language


end
