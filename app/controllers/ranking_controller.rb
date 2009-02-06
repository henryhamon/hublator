class RankingController < ApplicationController

  def show

    respond_to do |format|
      format.html
      format.xml  #{ render :xml => @ranking }
    end
  end
end
