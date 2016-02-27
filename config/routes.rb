Rails.application.routes.draw do

  # namespace :admin do
  #   resources :categories
  #   resources :gifs
  # end
  resources :categories, only: [:index, :new, :create, :show]

  resources :gifs, only: [:index, :new]
  #
  # resources :users, only: [:new, :index, :create, :show]
  #
  # get '/login', to: 'sessions#new'
  # post '/login', to: 'sessions#create'
  # delete '/logout', to: 'sessions#destroy'
  #
  # root to: 'users#index'

end
