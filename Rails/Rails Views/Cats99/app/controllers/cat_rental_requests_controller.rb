class CatRentalRequestsController < ApplicationController
  before_action only: [:approve, :deny] do
    if current_user == nil
      redirect_to cats_url
    else
      check_rental_request = CatRentalRequest.find_by_id(params[:id])
      if !current_user.cats.find_by(id: check_rental_request.cat_id)
        redirect_to cats_url
      end
    end
  end

  before_action only: [:new, :create] do
    if current_user == nil
      redirect_to cats_url
    end
  end

  def new
    @cats = Cat.order(:id)
    render :new
  end

  def approve
    @cat_rental_request = CatRentalRequest.find_by_id(params[:id])
    @cat_rental_request.approve!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end

  def deny
    @cat_rental_request = CatRentalRequest.find_by_id(params[:id])
    @cat_rental_request.deny!
    redirect_to cat_url(@cat_rental_request.cat_id)
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    @cat_rental_request.user_id = current_user.id
    if @cat_rental_request.save
      redirect_to cat_url(@cat_rental_request.cat_id)
    else
      render json: @cat_rental_request.errors.full_messages, status: :unprocessable_entity
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