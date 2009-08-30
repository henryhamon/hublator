class MainController < ApplicationController

  skip_before_filter :require_login, :only => [:index, :about]

  def index
    @recent_projects = Project.find(:all, :conditions => ["status = 'processed'"], :limit => 3, :order => ["created_at DESC"]) || []
    @hot_projects = Project.hot_projects
    @hall = User.hall_of_fame
  end

  def about
  end

end

