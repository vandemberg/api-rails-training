Rails.application.routes.draw do
  resources :payments, only: [:index, :update]
  resources :customers, only: [:index]
  resources :users, param: :_username
  resources :orders, only: [:create]

  post '/login', to: 'authentication#login'
end
