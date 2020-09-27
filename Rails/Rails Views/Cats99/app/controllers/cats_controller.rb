class CatsController < ApplicationController
  before_action :redirect_users_who_are_not_logged_in, only: [:new, :create, :edit, :update]

  before_action only: [:edit, :update] do
    redirect_to cats_url unless current_user.cats.find_by(id: params[:id])
  end

  def index
      @cats = Cat.order(:id)
      render :index
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    @owns_this_cat = (current_user != nil && current_user.cats.find_by(id: params[:id])) ? true : false
    @cat_rental_requests = CatRentalRequest.where({cat_id: params[:id]}).order(:start_date)

    if @cat == nil
      is_nil_message
    else
      render :show
    end
  end

  def new
    @cat = Cat.new
    render :new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.owner = current_user

    if @cat.save
      redirect_to cat_url(@cat.id)
    else
      render json: @cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def edit
    @cat = Cat.find_by_id(params[:id])
    if @cat == nil
      is_nil_message
    else
      render :edit
    end
  end

  def update
    @cat = Cat.find_by_id(params[:id])
    if @cat == nil
      is_nil_message
    else
      if @cat.update(cat_params)
        redirect_to cat_url(@cat.id)
      else
        render json: { errors: @cat.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end

  def is_nil_message
    render json: { errors: ['Cat does not exist'] }, status: :unprocessable_entity
  end
end