Rails.application.routes.draw do
  root to: 'home#index'
  resources :posts
  resources :users do
    collection do
      get :friends
      get :find_friends
    end
  end
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :follows, only: [:create, :destroy]

  get "front" => "home#front"
  get "sign_out" => "sessions#destroy"
  get "sign_in" => "sessions#create"
end
