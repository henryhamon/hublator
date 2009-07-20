class AssetsController < ApplicationController

  before_filter :find_asset

  ASSETS_PER_PAGE = 20

  def index
    @assets = Asset.paginate(:page => params[:page], :per_page => ASSETS_PER_PAGE)
    respond_to do |format|
      format.html
      format.xml  { render :xml => @assets }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xml  { render :xml => @asset }
    end
  end

  def new
    @asset = Asset.new
    respond_to do |format|
      format.html
      format.xml  { render :xml => @asset }
    end
  end

  def create
    @asset = Asset.new(params[:asset])
    respond_to do |format|
      if @asset.save
        flash[:notice] = 'Asset was successfully created.'
        format.html { redirect_to @asset }
        format.xml  { render :xml => @asset, :status => :created, :location => @asset }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @asset.update_attributes(params[:asset])
        flash[:notice] = 'Asset was successfully updated.'
        format.html { redirect_to @asset }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @asset.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @asset.destroy
        flash[:notice] = 'Asset was successfully destroyed.'        
        format.html { redirect_to assets_path }
        format.xml  { head :ok }
      else
        flash[:error] = 'Asset could not be destroyed.'
        format.html { redirect_to @asset }
        format.xml  { head :unprocessable_entity }
      end
    end
  end

  private

  def find_asset
    @asset = Asset.find(params[:id]) if params[:id]
  end

end
