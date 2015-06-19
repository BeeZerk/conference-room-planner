Rails.application.routes.draw do
  resources :events
  devise_for :users
  root :to => 'calendar#index'


  get 'startseite' => 'calendar#index', as: 'calendar'
  get ':token/month' => 'calendar#month', as: 'calendar_month'

  get 'event/new_small' => 'events#new_small'


  ######################################################
  ###################### Calendar
  ######################################################

  post 'calendar/fast_create' => 'calendar#fast_create', as: 'calendar_fast_create'
end

