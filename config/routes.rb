ActionController::Routing::Routes.draw do |map|
  map.resource :home
  map.resource :ranking

  map.resources :guilds
  map.resources :histories
  map.resources :spells
  map.resources :warriors

  map.namespace :backstage do |backstage|
    backstage.resources :levels
    backstage.resources :spells
    backstage.resources :histories

    backstage.logout '/logout', :controller => 'sessions', :action => 'destroy'
    backstage.login '/login', :controller => 'sessions', :action => 'new'
    backstage.register '/register', :controller => 'users', :action => 'create'
    backstage.signup '/signup', :controller => 'users', :action => 'new'
    backstage.resources :users
    backstage.resource :session
  end

  map.root :controller => 'home'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
