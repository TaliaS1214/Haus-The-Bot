Rails.application.routes.draw do

  root to: 'sessions#main'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  get '/about' => 'sessions#about'
  # User Routes
  post '/users'                             => 'users#create'

  # Sessions Routes
  resources :sessions, only: [:create, :destroy]

  resources :houses, only: [:show,:new,:create,:update] do
    resources :items, only: [:index,:create,:update]
  end

  post '/api/hausthebott'                   => 'items#hausthebott'

end
