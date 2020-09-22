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