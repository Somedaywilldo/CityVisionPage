Rails.application.routes.draw do


  #get 'sessions/new'

  root 'static_pages#home'
  get '/help',    to: 'static_pages#help' 
  get '/about',   to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  #demos 
  get '/density_demo', to: 'static_pages#density_demo'
  
  get '/style_demo', to: 'static_pages#style_demo'
  get '/semantic_demo', to: 'static_pages#semantic_demo'
  get '/problem_demo', to: 'static_pages#problem_demo'
  get '/statistic_demo', to: 'static_pages#statistic_demo'

  #spider demo
  get 'spider_demo/Beijing' #, to: 'spider_demo#spider_demo'
  get 'spider_demo/Shanghai'
  get 'spider_demo/Guangzhou'

  get '/signup',  to: 'users#new'
  post '/signup', to: 'users#create'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create' 
  delete '/logout', to: 'sessions#destroy'
  
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :microposts,          only: [:create, :destroy]
end