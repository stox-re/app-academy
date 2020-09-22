# Controller demo for silly_controller

class SillyController < ApplicationController
  def fun
    #render text: params
    render json: params
    #render text: params[:message]
  end

  def time
    render json: params
  end

  def super
    render json: params
  end
end

# params
# 1) query string
# 2) request body
# 3) url params/route params (wildcards)

class SuperheroesController < ApplicationController
  def index
    render json: Superhero.all
  end

  def create
    superhero = Superhero.new(superhero_params)
    if superhero.save
      render json: superhero
    else
      render json: superhero.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    superhero = Superhero.find_by_id(id: params[:id])
    render json: superhero
  end

  def update
    superhero = Superhero.find_by_id(id: params[:id])
    if superhero.update(superhero_params)
      render json: superhero
    else
      render json: superhero.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    superhero = Superhero.find_by_id(id: params[:id])
    if superhero.destroy
      render json: superhero
    else
      render json: "Can't destroy superhero, too important"
    end
  end

  def superhero_params
    params.require(:superhero).permit(:name, :secret_identity, :power)
    # in postman superhero[power]
  end
end

# Controllers are always named in the plural: PhotosController, UsersController

# app/controllers/clients_controller.rb
class ClientsController < ApplicationController
  def index
    render json: Client.all
  end

  def show
    render json: Client.find(params[:id])
  end
end

# config/routes.rb
MyLittleProject::Application.routes.draw do
  resources :clients, only: [:index, :show]
end

class PostsController < ApplicationController
  def create
    @post = Post.new(params[:post].permit(:title, :body))
    @post.save!
    render json: "Thanks for making the new post named #{@post.title}"
  end
end

class CatsController < ActionController::Base
  # Using "Cat.create(params[:cat])" would raise an
  # ActiveModel::ForbiddenAttributes exception because it'd be using
  # mass assignment without an explicit permit step.
  # This is the recommended form:
  def create
    Cat.create!(cat_params)
  end

  # This will pass with flying colors as long as there's a cat key in
  # the parameters, otherwise it'll raise an
  # ActionController::MissingParameter exception, which will get
  # caught by ActionController::Base and turned into a 400 Bad Request
  # reply.
  def update
    # params[:id] is a routing parameter; more in a sec!
    @cat = Cat.find(params[:id])
    @cat.update!(cat_params)
    render json: @cat
  end

  private

  # Using a private method to encapsulate the permissible parameters
  # is just a good pattern since you'll be able to reuse the same
  # permit list between create and update. Also, you can specialize
  # this method with per-user checking of permissible attributes.
  def cat_params
    params.require(:cat).permit(:name, :age)
  end
end