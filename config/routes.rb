Rails.application.routes.draw do
  resources :posts
  resources :users do
    member do
      get :friends
    end
  end
  resources :comments, only: [:create, :destroy]

  root to: 'home#index'
  get "front" => "home#front"
  get "sign_out" => "sessions#destroy"
  get "sign_in" => "sessions#create"
  get "find_friends" => "home#find_friends"

  post "/like" => "likes#create"
  post "/unlike" => "likes#destroy"
  post "/follow" => "follows#create", :as => :follow
  post "/unfollow" => "follows#destroy", :as => :unfollow
end
