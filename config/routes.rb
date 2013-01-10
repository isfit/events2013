Events::Application.routes.draw do
  get "events/index"
  get "events/show"

  resources :sessions
  namespace :admin do
    resources :events do
      resources :event_dates
      member do
        get :weight_move
      end
    end
  end

  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'

  root :to => 'events#index'
end
