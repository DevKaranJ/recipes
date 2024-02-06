Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root to: "home#index"

  resources :users, only: [:index] do
    resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    patch 'update_name', to: 'users#update_name', as: 'update_name'
  end

  resources :recipes, only: [] do
    patch 'toggle_public', on: :member
  end

  resources :public_recipes, only: [:index, :show, :destroy] do
    member do
      delete 'destroy_public_recipe', as: 'destroy_public'
    end
  end
end
