# Rest Api routes
# /config/routes.rb

Rails.application.routes.draw do
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show'
  # post 'users', to: 'users#create'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

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

#----------------------------
# bundle exec rake routes
# rails routes
# displays all routes after it processes everything from routes.rb
#----------------------------

# Another example
FlickrClone::Application.routes.draw do
  resources :photos

  root to: 'posts#index'
  # This is the GET / method
end
# This will generate:
# GET	/photos	index	display a list of all photos
# GET	/photos/new	new	return an HTML form for creating a new photo
# POST	/photos	create	upload and create a new photo
# GET	/photos/:id	show	display a specific photo
# GET	/photos/:id/edit	edit	return an HTML form for editing a photo
# PATCH or PUT	/photos/:id	update	update a specific photo
# DELETE	/photos/:id	destroy	delete a specific photo

# Specifying a resource route will also create a number of routing helper methods
# that your controllers and views can use to build URLs. In the case of resources :photos:

# photos_url	http://www.example-site.com/photos
# new_photo_url	http://www.example-site.com/photos/new
# photo_url(@photo)	http://www.example-site.com/photos/#{@photo.id}
# edit_photo_url(@photo)
