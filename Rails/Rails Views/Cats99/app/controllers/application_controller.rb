class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login_user!(username, password)
    user_check = User.find_by_credentials(username, password)
    if user_check == nil
      is_nil_message
    else
      user_check.reset_session_token!
      session[:session_token] = user_check.session_token
      redirect_to cats_url
    end
  end

  def redirect_users_who_are_logged_in
    redirect_to cats_url if current_user
  end

  def redirect_users_who_are_not_logged_in
    redirect_to cats_url if current_user == nil
  end
  def is_nil_message
    render json: { errors: ['User does not exist'] }, status: :unprocessable_entity
  end
end
