class SpellsController < ApplicationController

  def index

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @spells }
    end
  end

  def show

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @spell }
    end
  end
end
