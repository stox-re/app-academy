Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :todos, only: [:show, :index, :create, :update, :destroy] do
      resources :steps, only: [:index, :create, :update, :destroy]
    end
  end

  root to: 'static_pages#root'
end
