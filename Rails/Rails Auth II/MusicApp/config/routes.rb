Rails.application.routes.draw do
  resources :bands, only: [:index, :create, :new, :edit, :show, :update, :destroy]
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]

  root to: redirect("/bands")
end