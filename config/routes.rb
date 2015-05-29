Rails.application.routes.draw do
  resources :events
  resources :companies
  resources :categories
  resources :rooms
  devise_for :users
  root 'diko#index'
  get 'startseite' => 'diko#start', as: 'diko_start_page'
  get 'month' => 'diko#month', as: 'diko_month'
end

