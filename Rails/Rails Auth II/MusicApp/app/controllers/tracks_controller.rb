class TracksController < ApplicationController
  before_action :require_current_user!

  def new
    @albumn = Albumn.find_by({id: params[:albumn_id]})
    @albumns = Albumn.where({band_id: @albumn.band_id})
    render :new
  end

  def create
    new_track = Track.new(track_params)
    if new_track.save!
      redirect_to track_url(new_track.id)
    else
      flash[:errors] = new_track.errors.full_messages
      redirect_to new_albumn_track_url(new_track.albumn_id)
    end
  end

  def show
    @track = Track.find_by({id: params[:id]})
    render :show
  end

  def edit
    @track = Track.find_by({id: params[:id]})
    @albumn = Albumn.find_by({id: @track.albumn_id})
    @albumns = Albumn.where({band_id: @track.albumn.band_id})
    render :edit
  end

  def update
    update_track = Track.find_by({id: params[:id]})
    if update_track.update!(track_params)
      redirect_to track_url(update_track.id)
    else
      flash[:errors] = update_track.errors.full_messages
      redirect_to edit_track_url(update_track.id)
    end
  end

  def destroy
    track = Track.find_by(id: params[:id])
    if track.destroy!
      redirect_to albumn_url(track.albumn_id)
    else
      flash[:errors] = track.errors.full_messages
      redirect_to track_url(track.id)
    end

  end

  private

  def track_params
    params.require(:track).permit(:title, :ord, :lyrics, :is_bonus, :albumn_id)
  end
end