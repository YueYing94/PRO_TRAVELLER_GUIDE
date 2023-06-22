Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: "users#profile"
  resources :tours
  root to: "pages#home"
  get '/explorers/:id', to: "users#show", as: :user
end
