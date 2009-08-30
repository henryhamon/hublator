# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  url                 :string(255)
#  country             :string(255)
#  login               :string(255)
#  email               :string(255)
#  crypted_password    :string(255)
#  password_salt       :string(255)
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  openid_identifier   :string(255)
#  admin               :boolean
#  created_at          :datetime
#  updated_at          :datetime
#

require File.join(File.dirname(__FILE__), '..', 'spec_helper')

describe User do

  before do
    @user = Factory.create(:user)
  end
  
  should_validate_presence_of :name
  should_validate_presence_of :login
  should_validate_presence_of :email
  should_validate_presence_of :country
  
end
