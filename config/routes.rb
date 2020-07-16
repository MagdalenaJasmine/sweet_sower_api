Rails.application.routes.draw do
  devise_for :users 
  resources :cart_items
  resources :carts
  resources :items
  resource :sessions, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
