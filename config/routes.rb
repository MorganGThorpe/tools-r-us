Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:show]

  resources :tools do
    resources :bookings, only: [:create, :new]
    resources :reviews, only: [:create, :index, :show]
  end

  resources :bookings, only: [:index, :show, :update, :destroy]
end
