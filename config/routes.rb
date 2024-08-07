Rails.application.routes.draw do
  devise_for :users 
  root 'items#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index" 
  resources :items do
    resources :records, only: [:index, :create]
  end
  resources :purchases
end