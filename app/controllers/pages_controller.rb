class PagesController < ApplicationController
  include NestedResource
  before_filter :define_project

  def index
    @pages = @project.pages.find(:all, :conditions => { :is_review => false }, :order => ["page_number ASC"])
    @reviews = Page.find_by_sql "SELECT pages.id, pages.project_id, pages.language_id, pages.parent_id, pages.page_number, pages.content, pages.finished, pages.status
                                  FROM projects, pages LEFT JOIN interpreters ON (interpreters.page_id = pages.id)
                                  WHERE pages.project_id = #{@project.id} AND interpreters.user_id = #{current_user.id} AND interpreters.kind = 'revisor' GROUP BY pages.id"

    respond_to do |format|
      format.html
      format.xml  { render :xml => @pages }
    end
  end

  def edit
    @page = Page.find(params[:id])

    unless @page.project.user.id == current_user.id
      interpreter = Interpreter.find(:all, :conditions => {:page_id => @page.id, :user_id => current_user.id})
      unless interpreter.size > 0
        redirect_to project_page_path(@page.project, @page)
      end
    end
  end

  def show
    redirect_to project_pages_path(@project)
  end

  def update
    @page = Page.find(params[:id])

    unless params[:interpreter].nil?
      @page.parent.interpreters.find(:first, :conditions => {:kind => 'translator'}).update_attributes(params[:interpreter])
    end

    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = "Página '#{@page.page_number}' atualizado(a)."
        format.html { redirect_to(project_page_path(@page.project, @page)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end

  end

  def be_translator
    page = Page.find(params[:id])

    @page = Page.create!(:project => page.project,
                         :language_id => params[:language],
                         :parent_id => page.id,
                         :page_number => page.page_number,
                         :finished => false,
                         :status => 'blocked')

    Interpreter.create!(:user => current_user, :page => @page, :kind => 'translator')

    respond_to do |format|
      format.html { redirect_to(project_pages_path(@page.project)) }
      format.xml  { head :ok }
    end
  end

  def be_revisor
    page = Page.find(params[:id])

    @page = Page.create!(:project => page.project,
                         :language_id =>  page.language,
                         :parent_id => page.id,
                         :page_number => page.page_number,
                         :content => page.content,
                         :finished => false,
                         :status => 'blocked',
                         :is_review => true)

    Interpreter.create!(:user => current_user, :page => @page, :kind => 'revisor')

    respond_to do |format|
      format.html { redirect_to(project_pages_path(@page.project)) }
      format.xml  { head :ok }
    end
  end

  def define_project
    belongs_to [ :project ]
    @project = parent_object
  end
end

