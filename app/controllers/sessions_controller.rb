class SessionsController < ApplicationController
  before_filter :login_required, :only => :destroy
  
  def new
  end

  def create
    self.current_user = User.authenticate(params[:username], params[:password])
    if logged_in?
      flash[:notice] = "Logged in as #{current_user.username}."  
      redirect_to mines_path
    else
      flash[:notice] = "Username or password are incorrect."
      render :action => 'new'
    end
  end

  def destroy
    logout_killing_session!
    redirect_to login_path
  end
  
end

