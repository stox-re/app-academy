class AlbumnsController < ApplicationController
  def new
    @bands = Band.order(:id)
    @band = Band.find_by({id: params[:band_id]})
    puts "THE BAND"
    puts @band
    render :new
  end

  def create
    new_albumn = Albumn.new(albumn_params)
    if new_albumn.save!
      redirect_to albumn_url(new_albumn.id)
    else
      flash[:errors] = new_albumn.errors.full_messages
      redirect_to new_band_albumn_url(new_albumn.band_id)
    end
  end

  def show
    @albumn = Albumn.find_by({id: params[:id]})
    render :show
  end

  def edit
    @albumn = Albumn.find_by({id: params[:id]})
    @band = Band.find_by({id: @albumn.band_id})
    render :edit
  end

  def update
    update_albumn = Albumn.find_by({id: params[:id]})
    if update_albumn.update!(albumn_params)
      redirect_to albumn_url(update_albumn.id)
    else
      flash[:errors] = update_albumn.errors.full_messages
      redirect_to edit_albumn_url(update_albumn.id)
    end
  end

  def destroy
    @albumn = Albumn.find_by(id: params[:id])
    if @albumn.destroy!
      redirect_to band_url(@albumn.band_id)
    else
      flash[:errors] = @band.errors.full_messages
      redirect_to albumn_url(@albumn.id)
    end

  end

  private

  def albumn_params
    params.require(:albumn).permit(:band_id, :title, :year, :is_live)
  end
end