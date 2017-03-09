Rails.application.routes.draw do
  root 'landing#index'
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :jobs
end
