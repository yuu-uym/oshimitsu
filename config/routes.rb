Rails.application.routes.draw do
  devise_for :users
  root to: 'genres#index'

  resources :boards do
    resources :comments, only: :create
    collection do
      get 'search'
      get 'user'
    end
  end

  resources :genres do
    get 'items/search'
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
