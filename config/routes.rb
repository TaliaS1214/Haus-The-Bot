Rails.application.routes.draw do

  root to: 'application#index'

  # User Routes
  post '/users'                             => 'users#create'

  # Sessions Routes
  resources :sessions, only: [:create, :destroy]

  # House Routes
  post  '/houses'                           => 'houses#create'
  put   '/houses/:id'                       => 'houses#update'

  # Item Routes
  get   '/houses/:house_id/items'           => 'items#index'
  post  '/houses/:house_id/items/'          => 'items#create'
  put   '/houses/:house_id/items/:item_id'  => 'items#update'

end
