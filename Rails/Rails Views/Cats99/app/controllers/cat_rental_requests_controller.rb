class CatRentalRequestsController < ApplicationController
  def new
    @cats = Cat.order(:id)
    render :new
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end

  def is_nil_message
    render json: { errors: ['Cat does not exist'] }, status: :unprocessable_entity
  end
end