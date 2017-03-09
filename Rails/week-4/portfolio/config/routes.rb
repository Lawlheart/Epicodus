Rails.application.routes.draw do
  root :to => 'home#index'
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :projects
  resources :repos, only: [:index]
  get '/about' => 'about#show'
end
