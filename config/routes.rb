Rails.application.routes.draw do
  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    get '/', to: "dashboard#index"

    resources :users

    resources :rewards
  end

  resources :rewards, only: [:index]

  resources :users

  resources :redeemed_rewards, only: [:create]
end
