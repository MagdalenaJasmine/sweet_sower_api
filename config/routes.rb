Rails.application.routes.draw do
  devise_for :users 
  resources :users, only: [:index]
  resources :cart_items
  resources :carts
  resources :items
  resource :sessions, only: [:index, :create, :destroy]
  get '/current_user', to: 'sessions#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
