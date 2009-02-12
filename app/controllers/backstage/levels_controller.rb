class Backstage::LevelsController < BackstageApplicationController

  def index
    @levels = Level.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @levels }
    end
  end

  #def show
  #  @level = Level.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @level }
  #  end
  #end

  def new
    @level = Level.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @level }
    end
  end

  def edit
    @level = Level.find(params[:id])
  end

  def create
    @level = Level.new(params[:level])

    respond_to do |format|
      if @level.save
        flash[:notice] = 'Level was successfully created.'
        format.html { redirect_to(backstage_levels_path) }
        format.xml  { render :xml => @level, :status => :created, :location => @level }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @level.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @level = Level.find(params[:id])

    respond_to do |format|
      if @level.update_attributes(params[:level])
        flash[:notice] = 'Level was successfully updated.'
        format.html { redirect_to(backstage_levels_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @level.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @level = Level.find(params[:id])
    @level.destroy

    respond_to do |format|
      format.html { redirect_to(backstage_levels_path) }
      format.xml  { head :ok }
    end
  end

end
