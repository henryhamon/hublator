class Tag < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name

  has_and_belongs_to_many :project, :join_table => "projects_tags"

  def name=(n)
    write_attribute(:name, n.downcase) if n.instance_of? String
  end

end
