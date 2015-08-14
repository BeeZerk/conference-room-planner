Rails.application.routes.draw do

  resources :events
  devise_for :users, controllers: {sessions: 'sessions', registrations: 'devise_registration'}, :skip => [:sessions]

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  root :to => 'cuboise#dashboard'

  # get 'dashboard' => 'cuboise#dashboard'
  get 'startseite' => 'calendar#index', as: 'calendar'
  get ':token/month' => 'calendar#month', as: 'calendar_month'

  get 'event/new_small' => 'events#new_small'

  devise_scope :user do
    get 'login' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    get 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  ######################################################
  ###################### Calendar
  ######################################################

  post 'calendar/fast_create' => 'calendar#fast_create', as: 'calendar_fast_create'

  ######################################################
  ###################### Profile / user
  ######################################################
  get 'profile/:slug' => 'profiles#show', as: 'visit_profile'
end

