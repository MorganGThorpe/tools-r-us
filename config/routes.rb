Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:show]
  resources :tools do

    resources :bookings, only: [:create, :new, :edit, :update]
    resources :reviews, only: [:create, :new, :index, :show]
  end
  resources :bookings, only: [:index, :show, :destroy]
end
