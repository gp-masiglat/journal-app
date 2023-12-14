Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories
  resources :tasks
  resources :users, only: [:create]

  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/login', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "tasks#index"
end
