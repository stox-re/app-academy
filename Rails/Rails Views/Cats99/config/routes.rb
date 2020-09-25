Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :edit, :create, :update]
  resources :cat_rental_requests, only: [:new, :create]
  post 'cat_rental_requests/:id/approve', to: 'cat_rental_requests#approve'
  post 'cat_rental_requests/:id/deny', to: 'cat_rental_requests#deny'
end
