Rails.application.routes.draw do
  resources :events
  resources :companies
  resources :categories
  resources :rooms
  devise_for :users
  root :to => 'diko#start'

  # devise_scope :user do
  #   unauthenticated :user do
  #     root :to => 'devise/session#new', as: :unauthenticated_root
  #   end
  #   authenticated :user do
  #     root :to => 'diko#start', as: :authenticated_root
  #   end
  # end

  get 'startseite' => 'diko#start', as: 'diko_start_page'
  get 'month' => 'diko#month', as: 'diko_month'

  get 'event/new_small' => 'events#new_small'
end

