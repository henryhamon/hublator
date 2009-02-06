class WarriorsController < ApplicationController

  def index

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @warriors }
    end
  end

  def show

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @warrior }
    end
  end
end
