class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      login_user!(@user.email, @user.password)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
