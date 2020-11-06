class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def logged_in?
    current_user != nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def redirect_users_who_are_logged
    if logged_in?
      redirect_to "/"
    end
  end

  def require_current_user!
    redirect_to "/" if !logged_in?
  end
end
