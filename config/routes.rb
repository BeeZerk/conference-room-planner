# == Route Map
#
#                           Prefix Verb                  URI Pattern                                      Controller#Action
#          user_omniauth_authorize GET|POST              /users/auth/:provider(.:format)                  users/omniauth_callbacks#passthru {:provider=>/facebook|twitter|linked_in/}
#           user_omniauth_callback GET|POST              /users/auth/:action/callback(.:format)           users/omniauth_callbacks#:action
#                    user_password POST                  /users/password(.:format)                        devise/passwords#create
#                new_user_password GET                   /users/password/new(.:format)                    devise/passwords#new
#               edit_user_password GET                   /users/password/edit(.:format)                   devise/passwords#edit
#                                  PATCH                 /users/password(.:format)                        devise/passwords#update
#                                  PUT                   /users/password(.:format)                        devise/passwords#update
#         cancel_user_registration GET                   /users/cancel(.:format)                          registrations#cancel
#                user_registration POST                  /users(.:format)                                 registrations#create
#            new_user_registration GET                   /users/sign_up(.:format)                         registrations#new
#           edit_user_registration GET                   /users/edit(.:format)                            registrations#edit
#                                  PATCH                 /users(.:format)                                 registrations#update
#                                  PUT                   /users(.:format)                                 registrations#update
#                                  DELETE                /users(.:format)                                 registrations#destroy
#                                  GET|POST|PATCH|DELETE /404(.:format)                                   errors#error404
#                             root GET                   /                                                cuboise#dashboard
#                   calendar_month GET                   /:token/month(.:format)                          calendar#month
#                  event_new_small GET                   /event/new_small(.:format)                       events#new_small
#                 new_user_session GET                   /login(.:format)                                 devise/sessions#new
#                     user_session POST                  /signin(.:format)                                devise/sessions#create
#             destroy_user_session GET                   /signout(.:format)                               devise/sessions#destroy
#                     my_calendars GET                   /calendar(.:format)                              calendar#index
#                  ajax_get_events POST                  /calendar/ajax_get_events(.:format)              calendar#ajax_get_events
#                 ajax_get_eventsg GET                   /calendar/ajax_get_events(.:format)              calendar#ajax_get_events
#                           events POST                  /events(.:format)                                events#create
#                       new_events GET                   /events/new(.:format)                            events#new
#                      edit_events GET                   /events/edit(.:format)                           events#edit
#                                  GET                   /events(.:format)                                events#show
#                                  PATCH                 /events(.:format)                                events#update
#                                  PUT                   /events(.:format)                                events#update
#                                  DELETE                /events(.:format)                                events#destroy
#                    visit_profile GET                   /profile/:uuid(.:format)                         users/profiles#show
#                    show_follower GET                   /profile/:uuid/follower(.:format)                users/profiles#show_follower
#                   show_followees GET                   /profile/:uuid/followees(.:format)               users/profiles#show_followees
#               toggle_follow_user GET                   /profile/:uuid/toggle_follow(.:format)           social/follows#toggle_follow
#                       add_friend GET                   /profile/:uuid/friends/add(.:format)             users/profiles#add_friend
#                  social_messages POST                  /social/messages(.:format)                       social/messages#create
#               new_social_message GET                   /social/messages/new(.:format)                   social/messages#new
#        reply_social_conversation POST                  /social/conversations/:id/reply(.:format)        social/conversations#reply
#      restore_social_conversation POST                  /social/conversations/:id/restore(.:format)      social/conversations#restore
# mark_as_read_social_conversation POST                  /social/conversations/:id/mark_as_read(.:format) social/conversations#mark_as_read
# empty_trash_social_conversations DELETE                /social/conversations/empty_trash(.:format)      social/conversations#empty_trash
#             social_conversations GET                   /social/conversations(.:format)                  social/conversations#index
#              social_conversation GET                   /social/conversations/:id(.:format)              social/conversations#show
#                                  DELETE                /social/conversations/:id(.:format)              social/conversations#destroy
#

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
  resource :events
  post 'events/fast/create' => 'events#fast_create_event', as: 'fast_create_event'

  ######################################################
  ###################### Profile / user
  ######################################################

  ######################
  ########### Profile
  ######################
  get 'profile/:uuid' => 'users/profiles#show', as: 'visit_profile'

  ####Follow
  get 'profile/:uuid/follower' => 'users/profiles#show_follower', as: 'show_follower'
  get 'profile/:uuid/followees' => 'users/profiles#show_followees', as: 'show_followees'
  get 'profile/:uuid/toggle_follow/' => 'social/follows#toggle_follow', as: 'toggle_follow_user'

  ####Friendship
  get 'profile/:uuid/friends/add' => 'users/profiles#add_friend', as: 'add_friend'

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

