class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def logged_in?
    current_user != nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def log_the_user_in!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def login_user!(email, password)
    user_check = User.find_by_credentials(email, password)
    if user_check == nil
      flash[:errors] = ["User does not exist"]
      redirect_to new_session_url
    elsif user_check == false
      flash[:errors] = ["Password incorrect"]
      redirect_to new_session_url
    else
      log_the_user_in!(user_check)
      redirect_to '/all'
    end
  end

  def redirect_users_who_are_logged_in
    if logged_in?
      redirect_to "/all"
    end
  end

  def require_current_user!
    redirect_to new_user_url if !logged_in?
  end
end
