Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]
  resources :categories
  resources :deal_categories, only: [:new, :create]
  resources :deals


     authenticated :user do
      root to: 'categories#index'
    end
  
    devise_scope :user do
      root to: 'devise/sessions#splash', as: :splash_root
    end

    get '/older_categories' => "categories#older_index"
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  # resource :home
end
