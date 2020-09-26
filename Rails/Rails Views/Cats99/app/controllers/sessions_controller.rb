class SessionsController < ApplicationController
  before_action :redirect_users_who_are_logged_in, only: [:new, :create]

  def new
      render :new
  end

  def create
    login_user!(params[:user][:username], params[:user][:password])
  end

  def destroy
    if current_user != nil
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    end
  end
end