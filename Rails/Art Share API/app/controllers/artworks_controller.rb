class ArtworksController < ApplicationController
  def index
    render json: Artwork.all
  end

  def create
    art = Artwork.new(artwork_params)
    if art.save
      render json: art
    else
      render json: art.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: Artwork.find_by_id(params[:id])
  end

  def update
    art = Artwork.find_by_id(params[:id])
    if art == nil
      is_nil_message
    else
      if art.update(artwork_params)
        render json: art
      else
        render json: { errors: art.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  def destroy
    art = Artwork.find_by_id(params[:id])
    if art == nil
      is_nil_message
    else
      if art.destroy
        render json: art
      else
        render json: { errors: art.errors_full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

  def is_nil_message
      render json: { errors: ['Artwork does not exist'] }, status: :unprocessable_entity
  end
end