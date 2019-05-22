Rails.application.routes.draw do

  get 'password_resets/new'

  get 'password_resets/edit'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get  '/help', to: 'static_pages#help'
  get  '/about', to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'

  resources :users, :except => [:new, :create]
  resources :account_activations, only: [:edit]
  resources :password_resets, except: [:index, :destroy, :show]
  resources :microposts,          only: [:create, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end


  root 'static_pages#home'
end