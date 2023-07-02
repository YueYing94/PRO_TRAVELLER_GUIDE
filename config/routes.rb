Rails.application.routes.draw do
  devise_for :users
  get '/profile', to: "users#profile"
  resources :tours do
    resources :bookings, only: [:create, :new] do
      member do
        patch :accept_booking
        patch :decline_booking
      end
    end
  end
  root to: "pages#home"
  get '/explorers/:id', to: "users#show", as: :user
  resources :chatrooms do
    resources :messages, only: :create
  end

end
