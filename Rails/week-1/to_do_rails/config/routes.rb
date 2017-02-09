Rails.application.routes.draw do
  root :to => 'lists#index'

  resources :lists do
    resources :tasks, :except => [:show, :index]
  end
end
