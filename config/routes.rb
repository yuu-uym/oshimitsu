Rails.application.routes.draw do
  devise_for :users
  get 'items/search'
  root to: 'genres#index'
  resources :genres do
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
