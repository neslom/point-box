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

  #post "users/:id/rewards/:id", to: "redeemed_rewards#create"

  #resources :users, only: [:show] do
    #resources :redeemed_rewards, only: [:new, :create]
  #end
  #
  resources :redeemed_rewards, only: [:create]
end
