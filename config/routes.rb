Rails.application.routes.draw do

  root 'welcome#index'

  get "/login", to: "sessions#new", as: "new_session"
  post "/login", to: "sessions#create", as: "login"
  get "/signout", to: "sessions#destroy", as: "signout"

  resources :users
  get "/signup", to: "users#new", as: "new_signup"
  post "/signup", to: "users#create", as: "signup"

  resources :statuses
  resources :likes
end
