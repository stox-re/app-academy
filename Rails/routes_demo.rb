# Rest Api routes
# /config/routes.rb

Rails.application.routes.draw do
# get 'superheroes', to: 'superheroes#index'
# get 'superheroes/:id' to: 'superheroes#show'
# post 'superheroes' to: 'superheroes#create'
# patch 'superheroes/:id', to: 'superheroes#update'
# put 'superheroes/:id, to: 'superheroes#update'
# delete 'superheroes/:id', to 'superheroes#destroy'

# Can all be created with
# resources :superheroes, only [:index, :show, :create, :update, :destroy]

  #get 'superheroes/2/abilities'
  resources :superheroes do
    resources :abilities, only: [:index]
  end
  # This is called a collection route

  # member routes
  resources :abilities, only: [:show, :update, :create, :destroy]

  get 'silly', to: 'silly#fun'
  post 'silly' to: 'silly#time'
  post 'silly/:id' to: 'silly#super'
end

