class Backstage::HistoriesController < BackstageApplicationController

  def index
    @histories = History.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @histories }
    end
  end

  #def show
  #  @history = History.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @history }
  #  end
  #end

  def new
    @history = History.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @history }
    end
  end

  def edit
    @history = History.find(params[:id])
  end

  def create
    @history = History.new(params[:history])

    respond_to do |format|
      if @history.save
        flash[:notice] = 'History was successfully created.'
        format.html { redirect_to(backstage_histories_path) }
        format.xml  { render :xml => @history, :status => :created, :location => @history }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @history.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @history = History.find(params[:id])

    respond_to do |format|
      if @history.update_attributes(params[:history])
        flash[:notice] = 'History was successfully updated.'
        format.html { redirect_to(backstage_histories_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @history.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @history = History.find(params[:id])
    @history.destroy

    respond_to do |format|
      format.html { redirect_to(backstage_histories_path) }
      format.xml  { head :ok }
    end
  end

end
