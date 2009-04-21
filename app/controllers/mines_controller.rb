class MinesController < ApplicationController
  def index
    @mines = Mine.all
  end
  
  def new  
    @mine = Mine.new  
  end  
      
  def create  
    @mine = Mine.create!(params[:mine])  
    flash[:notice] = "New mine created."  
    redirect_to mines_path  
  end  

end
