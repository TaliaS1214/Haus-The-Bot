Rails.application.routes.draw do

  root to: 'users#new'
  get '/signup' => 'user#new'
  get '/login' => 'users#login'
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

  post '/api/hausthebott'                   => 'items#hausthebott'

end
