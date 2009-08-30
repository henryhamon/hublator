class UsersController < ApplicationController

  skip_before_filter :require_login, :only => [:new, :create]

  def show
    @user = User.find(params[:id])
  end

  def dashboard
    @user = current_user
    @recent_projects = Project.find(:all, :limit => 3, :order => "created_at DESC") || []
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save do |result|
      if result
        flash[:notice] = "Registration successful."
        redirect_to @user
      else
        render :action => 'new'
      end
    end
  end

  def edit
    @user = current_user
    @languages = Language.find(:all)
  end

  def update
    @user = current_user
    @user.attributes = params[:user]

    #limpa
    @user.speechs.each { |s| s.destroy }

    #recria
    params[:language][:id].each_with_index do |language, i|
      Speech.create!({:language_id => language, :user_id => @user.id, :level => params[:language][:id][i]})
    end

    @user.save do |result|
      if result
        flash[:notice] = "Successfully updated profile."
        redirect_to root_url
      else
        render :action => 'edit'
      end
    end
  end

  def follow
    Connection.create!({:user_id => current_user.id, :contact_id => params[:id]})
    redirect_to user_path(:id => params[:id])
  end

  def unfollow
    @connection = Connection.find(:first, :conditions => ["user_id = ? AND contact_id = ?", current_user.id, params[:id]])
    @connection.destroy unless @connection.nil?
    redirect_to user_path(:id => params[:id])
  end

end

