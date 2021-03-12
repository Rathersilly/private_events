Rails.application.routes.draw do
  resources :users
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#home'
  get "/signup",  to: "users#new"
  get "/login",   to: "sessions#new"
  post "/login",  to: "sessions#create"
  get "/logout",  to: "sessions#destroy"
end
