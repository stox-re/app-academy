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
    render json: User.find_by_id(params[:id])
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

  def destroy
    user = User.find_by_id(params[:id])
    if user == nil
      is_nil_message
    else
      if user.destroy
        render json: user
      else
        render json: { errors: user.errors_full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def is_nil_message
      render json: { errors: ['User does not exist'] }, status: :unprocessable_entity
  end
end