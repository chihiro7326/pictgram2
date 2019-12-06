Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  
  get 'users/new'
  root 'pages#index'
  get 'pages/help'
  root to: "home#index"
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :topics
end
