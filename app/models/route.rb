class Route
  def self.test
    routes = ActionController::Routing::Routes.routes.collect do |route|
      name = ActionController::Routing::Routes.named_routes.routes.index(route).to_s
      verb = route.conditions[:method].to_s.upcase
      segs = route.segments.inject("") { |str,s| str << s.to_s }
      segs.chop! if segs.length > 1
      reqs = route.requirements.empty? ? "" : route.requirements.inspect
      {:name => name, :verb => verb, :segs => segs, :reqs => reqs}
    end
  end
end
