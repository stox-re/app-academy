Rails.application.routes.draw do
  resource :session, only: [:create, :destroy, :new]
  resources :user_comments, only: [:create, :destroy]
  resources :goal_comments, only: [:create, :destroy]

  resources :users, only: [:new, :create, :show] do
    member do
      get "user_comment"
    end
  end

  resources :goals, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    member do
      get "goal_comment"
    end
  end

  root to: redirect("/goals")
end
