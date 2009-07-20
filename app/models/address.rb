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

class Address < ActiveRecord::Base

  belongs_to :city
  belongs_to :user

  validates_presence_of :street
  validates_presence_of :district
  validates_presence_of :city_id
  validates_presence_of :user_id

end
