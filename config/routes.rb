Events::Application.routes.draw do
  get "events/index"
  get "events/show"

  match "2013/:id" => "events#show", :constraints =>  { :year => /\d/ }
  match ":eventtype" => "events#index"

  resources :sessions
  namespace :admin do
    resources :events do
      resources :event_dates
      member do
        get :weight_move
      end
    end
    resources :event_places
  end

  match '/events/api.:format' => 'events#api'

  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'

  root :to => 'events#index'
end
