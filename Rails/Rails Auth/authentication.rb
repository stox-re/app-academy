# Set a key and value for a cookie
session[:session_token] = "something"
# Read cookie
session[:session_token]
session[:lang] = "English"
# Cookie can be set a maximum of 20 years

# For error messages, for 1 redirect
# Cookie that lives for 1 request
flash[:user_error] = "Username can't be blank"

#<% if flash[:user_error] != nil =>
#  <div class="error"><%= flash[:user_error] %></div>
#<% end %>

# Authentication pattern

# User model
validates :password, length: { minimum: 6, allow_nil: true }
# Overwrite password = method
User#password=(pw)
  self.password_digest = BCrypt::Password.create(pw)

User.new({ form_data }) # Calls password= method

generate_session_token
ensure_session_token!
reset_session_token!

User#find_by_credentials(username, password)
  # find username
  # check bcrypt password against digest

UserController
  new - register
  create - create new user
SessionController
  new - login
  create - logs you in
  destroy - log out
ApplicationController
  current_user
  @current_user ||=
  user.find_by_session_token
  session[:session_token]
  redirect_unless_logged_in

#Sending authenticity tokens in a form
<!-- this is a form on www.facebook.com -->
<form action="pages/appacademy/like" method="post">
  <input type="hidden"
         name="authenticity_token"
         value="<%= form_authenticity_token %>">

  <input type="submit" value="Like App Academy!">
</form>

# Controller and State

# config/routes.rb
SecretApp::Application.routes.draw do
  resource :feed
  resource :session
end

# app/controllers/sessions_controller.rb
# Don't do this. Use a hash function
class SessionsController < ApplicationController
  def create
    username = params[:user_name]
    password = params[:password]

    user = User.where(
      username: username,
      password_digest: # hash of the password
    ).first

    # generate a 16-digit random token
    user.session_token = SecureRandom::urlsafe_base64(16)
    user.save!

    # put the generated token in the client's cookies
    session[:session_token] = user.session_token
    redirect_to feed_url
  end

  def destroy
    # logout
    session_token = session[:session_token]
    user = User.find_by(session_token: session_token)

    user.session_token = SecureRandom::urlsafe_base64(16)
    user.save!
    session[:session_token] = nil

    flash[:notices] ||= []
    flash[:notices] << "You logged out. See you soon!"

    redirect_to root_url
  end
end

#<!-- in views/layouts/application.html.erb -->
#<!-- `Object#try` is a Rails addition which will try to call the
#      method if the object isn't `nil`.  -->
#<!-- ... -->
#<% flash[:notices].try(:each) do |msg| %>
#  <%= msg %>
#<% end %>
#<!-- ... -->

# app/controllers/feeds_controller.rb
class FeedsController < ApplicationController
  def show
    # pull the session token out of the client's cookies
    # it will be right where we left it in session[:session_token]

    session_token = session[:session_token]
    @user = User.find_by(session_token: session_token)

    # render feed for user...
  end
end

# Using flash.now
class SessionsController < ApplicationRecord
  def create
    username = params[:user_name]
    password = params[:password]

    user = User.where(
      username: username,
      password: password
    ).first

    if user.nil?
      # uh-oh, bad password
      flash.now[:notices] ||= []
      flash.now[:notices] << "Username/password combo was bad"

      render :new
      return
    end

    # ...
  end
end