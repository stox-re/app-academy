Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:create, :destroy, :new]
  resources :goals, only: [:index, :show, :new, :create, :edit, :update, :destroy]

  root to: redirect("/session/new")
end
