# == Schema Information
#
# Table name: languages
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  abbr       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Language < ActiveRecord::Base

  validates_presence_of :name, :abbr

  has_many :speechs
  has_many :users, :through => :speechs
  has_one :page

  def self.portuguese
    all.select &:portuguese?
  end

  def self.english
    all.select &:spanish?
  end

  def self.spanish
    all.select &:spanish?
  end


  def portuguese?
    name.downcase == 'portuguese'
  end

  def spanish?
    name.downcase == 'spanish'
  end

  def english?
    name.downcase == 'english'
  end


end

