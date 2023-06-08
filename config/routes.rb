Rails.application.routes.draw do
  devise_for :users
  resources :categories do 
     resources :deals 
     end

     authenticated :user do
      root to: 'categories#index'
    end
  
    devise_scope :user do
      root to: 'devise/sessions#index', as: :index_root
    end
  # resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  # resource :home
end
