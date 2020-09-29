class BandsController < ApplicationController
  before_action :require_current_user!

  def index
    @bands = Band.order(:id)
    render :index
  end

  def new
    render :new
  end

  def create
    new_band = Band.new(cat_rental_request_params)
    if new_band.save!
      redirect_to band_url(new_band.id)
    else
      flash[:errors] = @new_band.errors.full_messages
      redirect_to new_band_url
    end
  end

  def show
    @band = Band.find_by({id: params[:id]})
    render :show
  end

  def edit
    @band = Band.find_by({id: params[:id]})
    render :edit
  end

  def update
    update_band = Band.find_by({id: params[:id]})
    if update_band.update!(cat_rental_request_params)
      redirect_to band_url(update_band.id)
    else
      flash[:errors] = update_band.errors.full_messages
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    if @band.destroy!
      redirect_to bands_url
    else
      flash[:errors] = @band.errors.full_messages
    end

  end

  private

  def cat_rental_request_params
    params.require(:band).permit(:name)
  end
end