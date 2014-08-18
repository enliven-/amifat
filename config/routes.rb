Rails.application.routes.draw do

  resources :meals, except: [:show]
  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]

  get "log_out" => "sessions#destroy", as: "log_out"
  
  get "application/authenticate_user"

  root to: 'meals#index'

end
