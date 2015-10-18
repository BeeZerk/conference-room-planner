
Rails.application.routes.draw do

  devise_for :users, class_name: 'FormUser', controllers: {sessions: 'sessions',
                                   registrations: 'registrations',
                                   omniauth_callbacks: "users/omniauth_callbacks"},
             :skip => [:sessions]

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
  get 'calendar/ajax_get_events' => 'calendar#ajax_get_events', as: 'ajax_get_eventss'

  ######################################################
  ###################### Events
  ######################################################
  resource :events do
    get :autocomplete_user_slug, :on => :collection
  end
  post 'events/fast/create' => 'events#fast_create_event', as: 'fast_create_event'
  get 'events/today' => 'events#events_today', as: 'get_events_for_today'

  ######################################################
  ###################### Profile / user
  ######################################################

  ######################
  ########### Profile
  ######################
  get 'profile/:id' => 'users/profiles#show', as: 'visit_profile'

  ####Follow
  get 'profile/:id/follower' => 'users/profiles#show_follower', as: 'show_follower'
  get 'profile/:id/followees' => 'users/profiles#show_followees', as: 'show_followees'
  get 'profile/:id/toggle_follow/' => 'social/follows#toggle_follow', as: 'toggle_follow_user'

  ####Friendship
  get 'profile/:id/friends/add' => 'users/profiles#add_friend', as: 'add_friend'

  #####messages
  namespace :social do
    resources :messages, only: [:new, :create]
    resources :conversations, only: [:index, :show, :destroy] do
      member do
        post :reply
        post :restore
        post :mark_as_read
      end
      collection do
        delete :empty_trash
      end
    end
  end

end

