Rails.application.routes.draw do
  devise_for :users

  resources :cars do
    resources :events, only: [:index, :show, :new, :create], controller: 'cars/events'
  end
  resources :events
  resources :locations
  resources :features

  namespace :admin do
    resources :users, only: [:show, :index]
  end

  root to: 'pages#index'

  get 'pages/index'
  get 'pages/about'
  get 'pages/impressum'
  get 'pages/contact'
  get 'pages/privacy'
end
