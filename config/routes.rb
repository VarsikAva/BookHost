Rails.application.routes.draw do
  get 'users/show'

  devise_for :users
  authenticated :user do
    root to: 'books#index', as: :authenticated_root
  end
  root to: "pages#home"
  get "about", to: "pages#about"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :books do
    resources :bookings, only: [:new, :create, :index, :show, :destroy]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
  resources :messages, only: [:index, :new, :create]
  get 'messages/conversation/:receiver_id', to:  'messages#show_conversation'
  resources :users, only: [:show]
end
