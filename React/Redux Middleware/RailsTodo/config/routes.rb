Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :todos, only: [:show, :index, :create, :update, :destroy] do
      resources :steps, only: [:index, :create, :update, :destroy]
    end
  end

  resource :session, only: [:create, :destroy, :new]
  resources :users, only: [:new, :create]

  root to: redirect('/session/new')
  match '/all', to: 'static_pages#root', via: 'get', as: :all

end
