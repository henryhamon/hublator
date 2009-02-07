class LevelSweeper < ActionController::Caching::Sweeper
  observe Level

  def after_create(level)
    expire_cache_for(level)
  end
  
  def after_update(level)
    expire_cache_for(level)
  end
  
  def after_destroy(level)
    expire_cache_for(level)
  end
          
  private
  def expire_cache_for(record)
    expire_page(:controller => 'warriors', :action => 'index')
    expire_page(:controller => 'warriors', :action => 'show', :id => record.id)
  end
end
