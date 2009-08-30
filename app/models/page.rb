# == Schema Information
#
# Table name: pages
#
#  id          :integer         not null, primary key
#  project_id  :integer         not null
#  language_id :integer         not null
#  parent_id   :integer
#  page_number :integer         not null
#  content     :text
#  finished    :boolean
#  status      :string(255)     default("released")
#  created_at  :datetime
#  updated_at  :datetime
#

class Page < ActiveRecord::Base

  validates_presence_of :page_number

  belongs_to :project
  belongs_to :language # Language has_one :page
  has_many :interpreters
  has_many :users, :through => :interpreters
  has_many :activities, :as => :streamable, :dependent => :destroy
  #self join
  has_many :translations, :class_name => "Page", :foreign_key => "parent_id"
  belongs_to :parent, :class_name => "Page"

#  def can_translate?(language)
#    r = find(:first, :conditions => { :language_id => language, :project => self.project, :parent => page })
#    r.nil?
#  end

  def is_default_lang?(l)
    self.parent_id.nil? && self.language_id == l
  end

  def pending_languages
    abbr = []
    languages = self.project.translations.find(:all, :conditions => ["project_type != 'default'"])
    languages.each do |l|

      pages = Page.find(:all, :conditions => {:project_id => self.project_id, :parent_id => self.id, :language_id => l.language_id})

      abbr << l.language if pages.size == 0
    end
    abbr
  end

end

