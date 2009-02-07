class ActionSweeper < ActionController::Caching::Sweeper
  observe Action

  def after_create(action)
    expire_cache_for(action)
  end
  
  def after_update(action)
    expire_cache_for(action)
  end
  
  def after_destroy(action)
    expire_cache_for(action)
  end
          
  private
  def expire_cache_for(record)
    expire_page(:controller => 'ranking', :action => 'index')
    expire_page(:controller => 'ranking', :action => 'show', :id => record.id)
  end
end
