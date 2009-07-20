# == Schema Information
#
# Table name: states
#
#  id          :integer(4)      not null, primary key
#  abreviation :string(10)      default(""), not null
#  name        :string(20)      default(""), not null
#

class State < ActiveRecord::Base
  has_many :cities
end
