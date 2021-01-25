Rails.application.routes.draw do
  devise_for :users
  root to: 'genres#index'
  resources :bbss
  resources :genres do
    get 'items/search'
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
