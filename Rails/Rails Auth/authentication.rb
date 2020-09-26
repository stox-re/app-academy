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