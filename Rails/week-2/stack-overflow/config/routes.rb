Rails.application.routes.draw do
  root :to => 'questions#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', :as => :logout

  resources :users
  resources :questions do
    resources :answers, :except => [:show, :index]
  end
end
