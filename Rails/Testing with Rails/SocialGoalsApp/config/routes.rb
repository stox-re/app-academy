Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :create, :show] do
    member do
      get "user_comment"
    end
  end
  resource :session, only: [:create, :destroy, :new]
  resources :goals, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :user_comments, only: [:create, :destroy]

  root to: redirect("/goals")
end
