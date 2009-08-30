# == Schema Information
#
# Table name: projects
#
#  id                      :integer         not null, primary key
#  name                    :string(255)
#  category                :string(255)
#  url                     :string(255)
#  description             :text
#  user_id                 :integer         not null
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer
#  attachment_updated_at   :datetime
#  status                  :string(255)     default("pending")
#  created_at              :datetime
#  updated_at              :datetime
#

class Project < ActiveRecord::Base

  include AASM

  validates_presence_of :name, :category, :description, :user

  belongs_to :user
  has_many :translations
  has_many :languages, :through => :translations
  has_many :pages
  has_many :activities, :as => :streamable, :dependent => :destroy

  after_create :create_feed

  has_attached_file :attachment,
                  :url => "/assets/projects/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/projects/:id/:style/:basename.:extension"
  validates_attachment_size :attachment, :less_than => 10.megabytes
  validates_attachment_content_type = ['application/ms-word','application/txt','application/odf','application/rtf']
  validates_presence_of :attachment

  def translation_progress
    default_size = pages.select {|e| e.language_id == default_language.id}.size
    default_size = 1 if default_size.zero?
    _langs_ = languages - [default_language]
    _langs_.map do |e|
      acumulator = pages.select {|p| p.language_id == e.id }.size
      result =  0
      result = (acumulator * 10) / default_size unless acumulator == 0
      {e.id => result}
    end
  end

  def progress_with_banners
    _return_ = []
    translation_progress.each do |e|
      if e.keys.first != default_language.id
        lang = Language.find(e.keys.first)
        _return_ << {:banner => lang.abbr, :progress => e[e.keys.first] }
      end
    end
    _return_
  end

  def create_page
    if self.pages.size == 0
      if self.attachment_file_name.nil?
        Page.create!(:project => self,
                     :language_id => default_language,
                     :page_number => 1,
                     :content => 'type something here... ',
                     :finished => false,
                     :status => 'blocked')
        self.processed!
      end
    end
  end

  def default_language
    self.translations.find_by_project_type "default"
  end

  def language_id
    self.translations.find_by_project_type("default").language.id
  end

  def default_pages
    pages.select {|e| e.language_id == default_language.id}.size
  end

  #AASM
  aasm_column :status
  aasm_initial_state :initial => :pending

  aasm_state :processed
  aasm_state :pending
  aasm_state :working

  aasm_event :processed do
    transitions :from => :working, :to => :processed
  end

  aasm_event :pending do
    transitions :from => :processed, :to => :pending
  end

  aasm_event :working do
    transitions :from => :pending, :to => :working
  end

  class << self
    def hot_projects
      projects = Project.find_by_sql "SELECT projects.id, projects.name, projects.category, projects.url, projects.description, projects.user_id
                                      FROM projects, pages LEFT JOIN interpreters ON (interpreters.page_id = pages.id) GROUP BY projects.id LIMIT 3"
    end
  end


  private
  def create_feed
    Activity.create!(:streamable => self, :action => 'create', :user => self.user)
  end

end

