ActionController::Routing::Routes.draw do |map|
  map.resource :sessions
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.resources :mines
  
  map.resources :sieves
  
  map.resources :ores

#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
end
