class TwitterUserSweeper < ActionController::Caching::Sweeper
  observe TwitterUser

  def after_create(twitter_user)
    expire_cache_for(twitter_user)
  end
  
  def after_update(twitter_user)
    expire_cache_for(twitter_user)
  end
  
  def after_destroy(twitter_user)
    expire_cache_for(twitter_user)
  end
          
  private
  def expire_cache_for(record)
    expire_page(:controller => 'warriors', :action => 'index')
    expire_page(:controller => 'warriors', :action => 'show', :id => record.id)
  end
end
