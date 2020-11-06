class Api::SessionsController < ApplicationController
  def create
    user_check = User.find_by_credentials(params[:user][:email], params[:user][:password]))
    if user_check == nil
      render json: {success: false, message: 'User not found'}
    elsif user_check == false
      render json: {success: false, message: 'Password incorrect'}
    else
      user_check.reset_session_token!
      session[:session_token] = user.session_token
    end
  end

  def destroy
    if current_user != nil
      current_user.reset_session_token!
      session[:session_token] = nil
      redirect_to new_session_url
    end
  end
end
