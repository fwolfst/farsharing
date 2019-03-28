Rails.application.routes.draw do
  devise_for :users

  resources :cars do
    resources :events, only: [:show, :new, :create], controller: 'cars/events'
  end
  resources :events
  resources :locations
  resources :features

  root to: 'pages#index'

  get 'pages/index'
  get 'pages/contact'
  get 'pages/about'
  get 'pages/privacy'
end
