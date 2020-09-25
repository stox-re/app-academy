class CatsController < ApplicationController
  def index
      @cats = Cat.order(:id)
      render :index
  end

  def show
    @cat = Cat.find_by_id(params[:id])
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