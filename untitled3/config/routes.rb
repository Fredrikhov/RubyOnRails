Rails.application.routes.draw do


  get 'users/new'

  root 'welcome#index'

  get 'documentation/documentation'
  get 'documentation', to:'documentation#documentation', as:"documentation"

  get 'welcome/index'
  # sette welcome page to root

  #routes for logging in and hold a session

  get 'login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # routes for sign up
  get '/signup' => 'users#new'
  post '/users' => 'users#create'
  resources :users


  #routing from inside out

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
