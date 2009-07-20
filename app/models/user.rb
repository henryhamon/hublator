# == Schema Information
#
# Table name: users
#
#  id                  :integer(4)      not null, primary key
#  name                :string(255)     not null
#  birthdate           :date            not null
#  home_phone          :string(255)
#  mobile_phone        :string(255)
#  email               :string(255)     not null
#  login               :string(255)     not null
#  crypted_password    :string(255)     not null
#  password_salt       :string(255)     not null
#  persistence_token   :string(255)     not null
#  single_access_token :string(255)     not null
#  perishable_token    :string(255)     not null
#  login_count         :integer(4)      default(0), not null
#  failed_login_count  :integer(4)      default(0), not null
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class User < ActiveRecord::Base

  validates_presence_of :name
  validates_presence_of :login
  validates_presence_of :email
  validates_presence_of :birthdate

  validates_uniqueness_of :login
  validates_uniqueness_of :email

  has_one :address

  acts_as_authentic

end
