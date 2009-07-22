require File.dirname(__FILE__) + '/../spec_helper'

describe Crumb do


  should_validate_presence_of :route

  it 'should validates uniqueness of route' do
    Crumb.create(:route => '/posts')
    lambda { Crumb.create(:route => '/posts').should raise_error  }
  end

  it 'should respond to split and return an array of route pieces' do

    Crumb.should respond_to(:split)
    Crumb.split('/posts/:post_id/assets/:id(.:format)').should == ['/posts/:id/assets/:id', '/posts/:id/assets', '/posts/:id', '/posts', '/']
    Crumb.split('/posts/:post_id/assets(.:format)').should == ['/posts/:id/assets', '/posts/:id', '/posts', '/']
    Crumb.split('/posts/:id(.:format)').should == ['/posts/:id', '/posts', '/']
    Crumb.split('/posts(.:format)').should == ['/posts', '/']

  end

  it 'should sanitize routes eliminating the (.format) of them' do
    Crumb.instance_eval { sanitize_route('/posts/:id(.:format)') }.should == '/posts/:id'
    Crumb.instance_eval { sanitize_route('/posts/:post_id/assets/:id(.:format)') }.should == '/posts/:id/assets/:id'
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

    @ancestor = Crumb.create(:route => '/posts/:id(.:format)')
    @ancestor.set_parents!

    @crumb = Crumb.create(:route => '/posts/:post_id/assets/:id(.:format)')
    @crumb.set_parents!

    puts "#{@ancestor.id} ===> #{@ancestor.route}"
    puts @ancestor.ancestors.map{|e| "#{e.id} ===> #{e.route} " }.join("\n")
    puts '---------------'
    puts "#{@crumb.id} ===> #{@crumb.route}"
    puts @crumb.ancestors.map{|e| "#{e.id} ===> #{e.route} " }.join("\n")

    @crumb.splited_route.include?(@ancestor.route).should be_true
    @crumb.ancestors.map{|e| e.id }.include?(@ancestor.ancestors.map {|e| e.id }).should be_true

  end


end
