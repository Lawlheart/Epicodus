Rails.application.routes.draw do
  root :to => 'links#index'

  resources :links do
    resources :comments, :except => [:show, :index]
  end
end
