# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def breadcrumb
    return unless @entities
    home = content_tag(:li, link_to('home', '/'), :class => 'first')
   content_tag(:ul, home + make_url_for_entities(@entities).map {|e| content_tag(:li, link_to(e, e))}.reverse.to_s)
  end

  def make_url_for_entities(entities, base_urls = [])
    _entities_ = entities.dup
    return base_urls if _entities_.empty?
    actual_controller = _entities_.last.class.to_s.downcase.pluralize.to_sym unless _entities_.last.is_a?(Symbol)
    base_urls << url_for(_entities_)
    _entities_.pop 
    _entities_ << actual_controller if actual_controller
    make_url_for_entities(_entities_, base_urls)
  end

end
