Rails.application.routes.draw do

  root 'static_pages#home'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :notices
  resources :account_activation, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]


end
