class OresController < ApplicationController
  def index
    @ores = Ore.all
  end
  
  def new  
    @ore = Ore.new  
  end  
      
  def create  
    @ore = Ore.create!(params[:ore])  
    flash[:notice] = "New ore created."  
    redirect_to ores_path  
  end  


end
