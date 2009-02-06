class GuildsController < ApplicationController

  def index

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @guilds }
    end
  end

  def show

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @guild }
    end
  end
end
