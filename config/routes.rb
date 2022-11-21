Rails.application.routes.draw do
  get 'cars/index'
  get 'cars/show'
  get 'cars/new'
  get 'cars/update'
  get 'cars/destroy'
  get 'cars/create'
  get 'cars/edit'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
