Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: "users#profile"
  get 'users/:id/profile', to: 'users#profile', as: 'user_profile'
  resources :tours
  root to: "pages#home"
  resources :bookmarks, only: [:create, :destroy]
  resources :tours do
    member do
      post 'bookmark'
      get 'bookmark'
    end
  end
  resources :tours, only: [:index, :create]
end
