class UsersController < ApplicationController
  before_action :redirect_users_who_are_logged_in, only: [:new, :create]

  def new
      render :new
  end

  def create
    @user = User.new({username: params[:user][:username], password: params[:user][:password]})
    if @user.save
      msg = UserMailer.welcome_email(@user)
      msg.deliver_now
      login_user!(@user.username, @user.password)
    else
      render json: @user.errors.full_messages
    end
  end
end