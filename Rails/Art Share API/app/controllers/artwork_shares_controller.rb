class ArtworkSharesController < ApplicationController
  def create
    artshare = ArtworkShare.new(artwork_shares_params)
    if artshare.save
      render json: artshare
    else
      render json: { errors: artshare.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    artshare = ArtworkShare.find_by_id(params[:id])
    if artshare == nil
      is_nil_message
    else
      if artshare.destroy
        render json: artshare
      else
        render json: { errors: artshare.errors_full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def artwork_shares_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end

  def is_nil_message
    render json: { errors: ['ArtworkShare does not exist'] }, status: :unprocessable_entity
  end
end