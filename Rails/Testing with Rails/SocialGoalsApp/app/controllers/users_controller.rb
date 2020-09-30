class UsersController < ApplicationController
  before_action :require_current_user!, only: [:show]

  def new
    render :new
  end

  def show
    @goals = Goal.where({user_id: current_user.id})
    render :show
  end

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