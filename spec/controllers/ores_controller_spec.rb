require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OresController do

  #Delete these examples and add some real ones
  it "should use OresController" do
    controller.should be_an_instance_of(OresController)
  end


  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end
end
