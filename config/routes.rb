Rails.application.routes.draw do
  devise_for :users
  resources :tours
  root to: "pages#home"
end
