class SievesController < ApplicationController
  def index
    @sieves = Sieve.all
  end
  
  def new  
    @sieve = Sieve.new  
  end  
      
  def create  
    @sieve = Sieve.create!(params[:sieve])  
    flash[:notice] = "New sieve created."  
    redirect_to sieves_path  
  end  

end
