class UsersController < ApplicationController
  before_action :require_current_user!, only: [:show]

  def activate
    user = User.find_by({activation_token: params[:activation_token]})
    if user && user.activation_token == params[:activation_token]
      user.set_activate(true)
      flash[:errors] = ["Your account is activated, please login"]
      redirect_to new_session_url
    else
      flash[:errors] = ["Activation token invalid."]
      redirect_to new_session_url
    end
  end

  def new
    render :new
  end

  def show
    render :show
  end

  def create
    @user = User.new({email: params[:user][:email], password: params[:user][:password]})
    if @user.save
      msg = UserMailer.activation_email(@user)
      msg.deliver_now
      #login_user!(@user.email, @user.password)
      flash[:errors] = ["Please check your email to activate your account"]
      redirect_to new_user_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end
end