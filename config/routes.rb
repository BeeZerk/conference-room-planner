Rails.application.routes.draw do
  resources :events
  devise_for :users
  root :to => 'cuboise#start'


  get 'startseite' => 'cuboise#start', as: 'cuboise_start_page'
  get ':token/month' => 'calendar#month', as: 'calendar_month'

  get 'event/new_small' => 'events#new_small'
end

