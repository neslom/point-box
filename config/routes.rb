Rails.application.routes.draw do
  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  namespace :admin do
    get '/', to: "dashboard#index"
  end

  resources :users
end
