Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: "users#profile"
  resources :users, only: []  do
    resources :reviews, only: [:create, :new]
  end
  resources :tours do
    resources :bookings, only: [:create, :new, :destroy] do
      member do
        patch :accept
      end
    end
    post 'bookmarks', to: 'bookmarks#create', as: :bookmarks
  end
  root to: "pages#home"
  get '/explorers/:id', to: "users#show", as: :user
  resources :chatrooms do
    resources :messages, only: :create
  end
end
