require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Sieve do
  before(:each) do
    @valid_attributes = {
      :name => "value for name",
      :description => "value for description",
      :title => "value for title",
      :home_url => "value for home_url"
    }
  end

  it "should create a new instance given valid attributes" do
    Sieve.create!(@valid_attributes)
  end
end
