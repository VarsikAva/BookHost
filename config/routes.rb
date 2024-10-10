Rails.application.routes.draw do
  get 'books/index'
  get 'books/show'
  get 'books/new'
  get 'books/edit'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/edit'
  get 'orders/index'
  get 'orders/show'
  get 'orders/new'
  get 'orders/edit'
  devise_for :users
  root to: "pages#home"
  get "about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :orders, :books, :users
end
