Rails.application.routes.draw do
  resources :cats, only: [:index, :show, :new, :edit, :create, :update]
  resources :cat_rental_requests, only: [:new, :create]
end
