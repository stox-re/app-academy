Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :subs, only: [:index, :show, :new, :create, :edit, :update]
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]

  root to: redirect("/subs")
end