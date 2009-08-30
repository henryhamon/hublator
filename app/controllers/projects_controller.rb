class ProjectsController < ApplicationController

  def index
    redirect_to dashboard_user_path(current_user)
  end

  def new
    @project = Project.new
    @languages_source = Language.all
    @languages = @languages_source.clone

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  def show
    @project = Project.find(params[:id])
    redirect_to project_pages_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
    @languages_source = Language.find(:all)
    @languages = Language.find(:all, :conditions => ['id not in (?)', @project.translations])
  end

  def create
    @project = Project.new(params[:project].merge(:user => current_user))

    respond_to do |format|
      if @project.save and save_translations
        @project.translations.create!(:language_id => params[:language][:source], :project_type => "default")
        @project.create_page

        flash[:notice] = "Project '#{@project.name}' created."
        format.html { redirect_to project_pages_path(@project)  }
      else
        @languages_source = Language.all
        @languages = @languages_source.clone
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        flash[:notice] = "Tema '#{@project.name}' atualizado(a)."
        format.html { redirect_to(@project) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.js { render(:update) {|page| page.visual_effect(:fade, "project_#{@project.id}") } }
      format.xml  { head :ok }
    end
  end

  def search
    @projects = Project.all(:conditions => ["name like ?", "%#{params[:query]}%"], :order => :name)

    respond_to do |format|
      format.html
    end
  end

  protected

  def save_translations
    if params[:language][:translations].blank?
      @project.errors.add(:translations, 'You must select at least one language to translate this project.')
      return false
    end
    params[:language][:translations].each_with_index do |language, i|
      @project.translations.create!({:language_id => language, :project_type => "translate"})
    end
    true
  end

end

