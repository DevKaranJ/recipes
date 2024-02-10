Rails.application.routes.draw do
  get 'public_recipes/index'
  get 'public_recipes/show'
  get 'home/index'
  devise_for :users, sign_out_via: [:get, :delete]
  get '/food_list', to: 'foods#index', as: 'food_list'
  get "up" => "rails/health#show", as: :rails_health_check
  root to: "home#index"

  resources :users, only: [:index] do
    resources :recipes, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    resources :foods
    patch 'update_name', to: 'users#update_name', as: 'update_name'
    resources :inventories do
      resources :inventory_foods, only: [:new, :create, :destroy]
    end
  end

  resources :recipes, only: [] do
    resources :ingredients, only: [:new, :create, :edit, :update, :destroy]
    patch 'toggle_public', on: :member
  end

  resources :users do
    resources :recipes do
      resources :recipe_foods, only: [:new]
    end
  end

  resources :users do
    resources :recipes do
      resources :recipe_foods, only: [:new, :create, :destroy]
    end
  end

  resources :public_recipes, only: [:index, :show]
  resources :users do
    resources :recipes do
      get 'shopping_list', on: :member
    end
  end
end
