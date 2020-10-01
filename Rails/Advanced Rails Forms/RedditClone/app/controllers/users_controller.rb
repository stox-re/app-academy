class UsersController < ApplicationController
  before_action :require_current_user!, only: [:show]

  def new
    render :new
  end

  def show
    @moderated_subs = Sub.where({moderator_id: current_user.id})
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