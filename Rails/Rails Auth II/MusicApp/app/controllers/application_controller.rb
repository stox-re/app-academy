class ApplicationController < ActionController::Base
  helper_method :current_user

  def logged_in?
    current_user != nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_in_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def login_user!(email, password)
    user_check = User.find_by_credentials(email, password)
    if user_check == nil
      is_nil_message
    else
      log_in_user!(user_check)
      redirect_to user_url(current_user.id)
    end
  end

  def redirect_users_who_are_logged
    if logged_in?
      redirect_to user_url
    end
  end

  def redirect_users_who_are_not_logged_in
    redirect_to new_user_url if !logged_in?
  end
end
