Events::Application.routes.draw do

  match "/appsupport" => "events#appsupport"

  get "marketing/poster"

  get "events/index"
  get "events/show"
  get "events/all" => "events#index"
  get "events/free" => "events#free"
  get "events/speakers" => "events#speakers"

  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'

  match "2013/:id" => "events#show", :constraints =>  { :year => /\d/ }


  resources :sessions
  namespace :admin do
    resources :events do
      resources :event_dates
      member do
        get :weight_move
      end
    end
    resources :event_places
    resources :speakers
  end

  match '/events/api.:format' => 'events#api'
  match '/events/iosapi.:format' => 'events#iosapi'
  match '/events/androidapi.:format' => 'events#androidapi'

  match ":eventtype" => "events#index"

  root :to => 'marketing#poster'
end
