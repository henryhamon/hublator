require File.dirname(__FILE__) + '/../spec_helper'

describe Address do

  before do
    @address = Factory(:address)
  end

  should_validate_presence_of :street
  should_validate_presence_of :district
  should_validate_presence_of :city_id
  should_validate_presence_of :user_id

  should_belong_to :user
  should_belong_to :city

end
