class CatsController < ApplicationController
  def index
      @cats = Cat.all
      render :index
  end

  def create
    new_cat = Cat.new(cat_params)
    if new_cat.save
      redirect_to cat_url(new_cat.id)
    else
      render json: new_cat.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    @cat = Cat.find_by_id(params[:id])
    render :show
  end

  def new
    render :new
  end

  def update
    user = User.find_by_id(params[:id])
    if user == nil
      is_nil_message
    else
      if user.update(user_params)
        render json: user
      else
        render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
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