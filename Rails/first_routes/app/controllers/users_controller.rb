class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    puts params
    render json: User.find_by_id(params[:id])
  end

  def update
    user = User.find_by_id(params[:id])
    if user.update(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user.destroy
      render json: user
    else
      render json: user.errors_full_messages, status: :unprocessable_entity
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end