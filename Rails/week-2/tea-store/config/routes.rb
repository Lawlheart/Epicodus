Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users
  resources :teas do
    resources :reviews, :except => [:show, :index, :new, :edit]
  end
end
