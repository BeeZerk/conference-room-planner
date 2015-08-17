Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'sessions', registrations: 'devise_registration'}, :skip => [:sessions]

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ]
  root :to => 'cuboise#dashboard'

  # get 'dashboard' => 'cuboise#dashboard'
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

  get 'calendar' => 'calendar#index', as: 'my_calendars'


  post 'calendar/ajax_get_events' => 'calendar#ajax_get_events', as: 'ajax_get_events'

  ######################################################
  ###################### Events
  ######################################################
  get 'events' => 'events#index', as: 'events'

  ######################################################
  ###################### Profile / user
  ######################################################
  get 'profile/:slug' => 'profiles#show', as: 'visit_profile'
end

