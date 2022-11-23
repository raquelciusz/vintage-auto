Rails.application.routes.draw do
  resources :cars do
    resources :sales, only: :create
  end
  resources :sales, only: [:show, :index]
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
