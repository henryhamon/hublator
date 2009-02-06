class HistoriesController < ApplicationController

  def index

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @histories }
    end
  end

  def show

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @history }
    end
  end
end
