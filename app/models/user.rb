# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  name                :string(255)
#  url                 :string(255)
#  country             :string(255)
#  login               :string(255)
#  email               :string(255)
#  crypted_password    :string(255)
#  password_salt       :string(255)
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  openid_identifier   :string(255)
#  admin               :boolean
#  created_at          :datetime
#  updated_at          :datetime
#

class User < ActiveRecord::Base

  #validations

  validates_presence_of :name, :login, :email

  has_many :speechs
  has_many :languages, :through => :speechs
  has_many :projects

  has_many :interpreters
  has_many :pages, :through => :interpreters
  has_many :activities, :as => :streamable, :dependent => :destroy

  has_many :connections
  has_many :contacts, :through => :connections

  after_create :create_feed

  is_gravtastic!

  [:positive_consistency, :positive_translation, :negative_consistency, :negative_translation].each do |method|
    delegate method, :to => :interpreters
  end

  def consistency_rate
    (positive_consistency.size + negative_consistency.size) / 2
  end

  def translation_rate
    (positive_consistency.size + negative_consistency.size) / 2
  end

  def overal_rate
    (consistency_rate + translation_rate) / 2
  end

  def self.hall_of_fame
    all.sort {|a, b| a.overal_rate <=> b.overal_rate }.take(3) || []
  end

  def streams
    Activity.find(:all, :conditions => {:user_id => self.id}, :order => ["created_at DESC"], :limit => 20) || []
  end

  def feeds
    streams = Activity.find_by_sql(["SELECT activities.id, activities.streamable_id, activities.streamable_type, activities.action, activities.created_at, activities.updated_at, activities.user_id
                                     FROM activities LEFT JOIN connections ON (connections.contact_id = activities.user_id)
                                     WHERE connections.user_id = ? OR activities.user_id = ? ORDER BY activities.created_at DESC LIMIT 20", self.id, self.id ])
    streams.nil? ? [] : streams
  end

  acts_as_authentic do |c|
    c.openid_required_fields = [:nickname, :email]
  end

  private
  def create_feed
    Activity.create!(:streamable => self, :action => 'create', :user => self)
  end

  def map_openid_registration(registration)
    self.email = registration["email"] if email.blank?
    self.name = registration["nickname"] if name.blank?
  end
end

