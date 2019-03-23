Rails.application.routes.draw do
  resources :cars
  devise_for :users
  root to: 'pages#index'

  get 'pages/index'
  get 'pages/contact'
  get 'pages/about'
  get 'pages/privacy'
end
