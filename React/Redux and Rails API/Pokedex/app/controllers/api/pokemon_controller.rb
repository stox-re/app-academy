class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
    render :index
  end

  def show
    @pokemon = Pokemon.find_by({id: params[:id]})
    render :show
  end

  def create
    @pokemon = Pokemon.new(pokemon_parmas)
    if @pokemon.save
      render json: { success: true, pokemon: @pokemon }
    else
      render json: { success: false, errors: @pokemon.errors.full_messages }
    end
  end

  def pokemon_parmas
    params.require(:pokemon).permit(:name, :attack, :defense, :poke_type, :moves, :image_url)
  end
end