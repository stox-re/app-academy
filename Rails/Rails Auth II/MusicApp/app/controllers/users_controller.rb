class UsersController < ApplicationController
  before_action :redirect_users_who_are_not_logged_in, only: [:show]

  def new
    render :new
  end

  def show
    render :show
  end

  def create
    @user = User.new({email: params[:user][:email], password: params[:user][:password]})
    if @user.save
      login_user!(@user.email, @user.password)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end
end