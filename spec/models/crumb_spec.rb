require File.dirname(__FILE__) + '/../spec_helper'

describe Crumb do


  should_validate_presence_of :route

  it 'should validates uniqueness of route' do
    Crumb.create(:route => '/posts')
    lambda { Crumb.create(:route => '/posts').should raise_error  }
  end

  it 'should respond to split and return an array of route pieces' do

    Crumb.should respond_to(:split)
    Crumb.split('/posts/:post_id/assets/:id(.:format)').should == ['/posts/:post_id/assets/:id', '/posts/:post_id/assets', '/posts/:post_id', '/posts', '/']
    Crumb.split('/posts/:post_id/assets(.:format)').should == ['/posts/:post_id/assets', '/posts/:post_id', '/posts', '/']
    Crumb.split('/posts/:id(.:format)').should == ['/posts/:id', '/posts', '/']
    Crumb.split('/posts(.:format)').should == ['/posts', '/']

  end

  it 'should return an array with ancestors routes' do
    @crumb = Crumb.create(:route => '/posts/:post_id/assets/:id(.:format)')
    @crumb.ancestors_routes.should == @crumb.splited_route[1..-1]
  end

  it 'should create the crumb and link create its parents' do

    @crumb = Crumb.create(:route => '/posts/:post_id/assets/:id(.:format)')
    @crumb.set_parents!

    ([@crumb] + @crumb.ancestors).map {|c| c.route }.should == @crumb.splited_route

  end

  it 'should link crumb to its existing ancestor in the database' do

    @ancestor = Crumb.create(:route => '/posts/:id')
    @ancestor.set_parents!

    @crumb = Crumb.create(:route => '/posts/:post_id/assets/:id(.:format)')
    @crumb.set_parents!

    @crumb.splited_route.include?(@ancestor.splited_route).should be_true

  end


end
