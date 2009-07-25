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
    a = splited_route.dup ; a.delete(a.first) ; a
  end

  def sanitize_route!
    self.route = self.class.sanitize_route(route)
    save
  end

  def set_parents!
    return if route == '/'
    begin
      self.parent_id = Crumb.find_by_route(ancestors_routes.first).id
      save
    rescue
      _parent_ = Crumb.create(:route => ancestors_routes.first)
      self.parent_id = _parent_.id
      self.save
      _parent_.set_parents!
      save
    end
  end

  private

  def self.sanitize_route(route)
    route.to_s.gsub(/(\(.*\))/, '').gsub(/:\w*-*/, ':id')
  end

  def self.split_route(route, stack = [])
    return stack << '/' if route.blank?
    stack << route
    split_route(route.split('/')[0..-2].join('/'), stack)
  end

end
