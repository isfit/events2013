Events::Application.routes.draw do
  get "events/index"
  get "events/show"

  resources :sessions
  namespace :admin do
    resources :events
  end

  match 'login' => 'sessions#new'
  match 'logout' => 'sessions#destroy'

  root :to => 'events#index'
end
