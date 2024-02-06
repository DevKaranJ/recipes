Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/show'
  get 'home/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "home#index"
  root to: "users#index"
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :destroy]
  end
  resources :recipes, only: [:index, :new, :create, :show, :destroy] do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
patch 'update_name', to: 'users#update_name', as: 'update_name'

end
