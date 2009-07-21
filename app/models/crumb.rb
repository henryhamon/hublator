class Crumb < ActiveRecord::Base

  acts_as_tree

  after_create :sanitize_route!

  validates_presence_of :route
  validates_uniqueness_of :route

  def self.split(route)
    split_route(sanitize_route(route))
  end

  def splited_route
    Crumb.split(route)
  end

  def ancestors_routes
    splited_route[1..-1]
  end

  @test = 0

  def sanitize_route!
    self.route = self.class.sanitize_route(route)
    save
  end

  def set_parents!
    begin
      parent_id = Crumb.find_by_route(ancestors_routes.first).id
      save
    rescue
      parent = Crumb.create(:route => ancestors_routes.first)
      self.parent_id = parent.id
      self.save
      parent.set_parents!
      save
    end
  end

  private

  def self.sanitize_route(route)
    route.gsub(/(\(.*\))/, '')
  end

  def self.split_route(route, stack = [])
    return stack << '/' if route.blank?
    stack << route
    split_route(route.split('/')[0..-2].join('/'), stack)
  end

end
