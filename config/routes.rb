Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show] do 
    resources :comments, only: [:show, :create, :destroy]
    collection do 
      get :feeds
      get :followships
    end
    member do 
      get :dashboard
      post :favorite
      post :unfavorite
      post :like
      post :unlike
    end
  end
  root "restaurants#index"
  resources :categories, only: :show
  resources :users, only: [:index, :show, :edit, :update]
  resources :followships, only: [:create, :destroy]

  namespace :admin do
    resources :restaurants
    resources :categories
    root "restaurants#index"
  end
end
