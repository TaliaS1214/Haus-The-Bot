Rails.application.routes.draw do

  # User Routes
  post '/users'                             => 'users#create'

  # House Routes
  post  '/houses'                           => 'houses#create'
  put   '/houses/:id'                       => 'houses#update'

  # Item Routes
  get   '/houses/:house_id/items'           => 'items#index'
  post  '/houses/:house_id/items'           => 'items#create'
  put   '/houses/:house_id/items/:item_id'  => 'items#update'

end
