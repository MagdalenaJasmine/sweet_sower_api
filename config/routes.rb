Rails.application.routes.draw do
  # devise_for :users 
  resources :users, only: [:index, :create]
  resources :cart_items
  resources :carts, only: [:index, :show]
  resource :sessions, only: [:index, :create, :destroy]
  get '/current_user', to: 'sessions#show'
  post '/items', to: 'items#read_csv'
  resources :items
  post '/carts', to: 'carts#update'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end