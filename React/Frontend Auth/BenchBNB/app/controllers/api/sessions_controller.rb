class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @user_check = User.find_by_credentials(params[:user][:email], params[:user][:password])

    if @user_check == nil
      render json: {success: false, status: 401, errors: ['User not found']}
    elsif @user_check == false
      render json: {success: false, status: 422, errors: ['Invalid credentials']}
    else
      @user_check.reset_session_token!
      session[:session_token] = @user_check.session_token
      render json: @user_check
    end
  end

  def destroy
    if current_user != nil
      current_user.reset_session_token!
      session[:session_token] = nil
      render json: {success:true}
    else
      render json: {success:false, errors: ['No session to delete']}
    end
  end
end
