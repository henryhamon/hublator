# == Schema Information
#
# Table name: cities
#
#  id       :integer(4)      not null, primary key
#  state_id :integer(4)      default(0), not null
#  name     :string(50)      default(""), not null
#

class City < ActiveRecord::Base
  belongs_to :state
end
