Rails.application.routes.draw do
  resources :users, only: [:create, :show, :update, :destroy]
  resources :artworks, only: [:index, :create, :show, :update, :destroy]
  resources :artwork_shares, only: [:create, :destroy]

  resources :users do
    resources :artworks, only: :index
  end

end
