Rails.application.routes.draw do
  root :to => 'choices#index'
  resources :choices, :except => [:edit] do
    resources :votes, :except => [:edit, :index, :destroy, :show, :new]
    resources :comments, :except => [:index, :show]
  end
end
