Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :todos, only: [:show, :index, :create, :update, :destroy]
  end

  root to: 'static_pages#root'
end
