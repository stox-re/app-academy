class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user = User.new(user_params)
    if @user.save
      render json: {success: true, user: @user}
    else
      render json: {success: false, errors: @user.errors.full_messages}
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
