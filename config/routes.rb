Rails.application.routes.draw do

  namespace :admin do
    resources :categories
    resources :gifs, only: [:new, :index, :create, :show, :destroy]
  end

  resources :categories, only: [:index, :show]

  resources :gifs, only: [:new, :index, :create, :show, :destroy]

  resources :users, only: [:new, :create, :show] do
    resources :favorites, only: [:index, :show, :new, :create]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root to: 'users#index'

end
