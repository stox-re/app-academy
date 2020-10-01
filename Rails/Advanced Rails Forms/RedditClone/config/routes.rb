Rails.application.routes.draw do

  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :subs, only: [:index, :show, :new, :create, :edit, :update]

  root to: redirect("/subs")
end