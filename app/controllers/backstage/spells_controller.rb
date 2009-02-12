class Backstage::SpellsController < BackstageApplicationController

  def index
    @spells = Spell.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @spells }
    end
  end

  #def show
  #  @spell = Spell.find(params[:id])
  #
  #  respond_to do |format|
  #    format.html # show.html.erb
  #    format.xml  { render :xml => @spell }
  #  end
  #end

  def new
    @spell = Spell.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @spell }
    end
  end

  def edit
    @spell = Spell.find(params[:id])
  end

  def create
    @spell = Spell.new(params[:spell])

    respond_to do |format|
      if @spell.save
        flash[:notice] = 'Spell was successfully created.'
        format.html { redirect_to(backstage_spells_path) }
        format.xml  { render :xml => @spell, :status => :created, :location => @spell }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @spell.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @spell = Spell.find(params[:id])

    respond_to do |format|
      if @spell.update_attributes(params[:spell])
        flash[:notice] = 'Spell was successfully updated.'
        format.html { redirect_to(backstage_spells_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @spell.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @spell = Spell.find(params[:id])
    @spell.destroy

    respond_to do |format|
      format.html { redirect_to(backstage_spells_path) }
      format.xml  { head :ok }
    end
  end

end
