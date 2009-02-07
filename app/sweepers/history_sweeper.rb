class HistorySweeper < ActionController::Caching::Sweeper
  observe History

  def after_create(history)
    expire_cache_for(history)
  end
  
  def after_update(history)
    expire_cache_for(history)
  end
  
  def after_destroy(history)
    expire_cache_for(history)ss
  end
          
  private
  def expire_cache_for(record)
    expire_page(:controller => 'histories', :action => 'index')
    expire_page(:controller => 'histories', :action => 'show', :id => record.id)
  end
end
