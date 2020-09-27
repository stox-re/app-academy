# --------------------- Phase I ---------------------

# Using Bcrypt
require 'bcrypt'
# => true
password_hash = BCrypt::Password.create('my_secret_password')
# => "Some string hash"
password_hash.is_password?('my_secret_password')
# => true
password_hash.is_password?('not_my_secret_password')
# => false

#--------------------- Phase 2 - The User model ---------------------
# Let's start with `rails g model user`.
# Add string columns to the users table: username and password_digest.
# Digest is another name for a hash. Toss on an index for username too (make it unique).

# Storing/Verifying A Password

u = User.new
# => #<User id: nil, username: nil, password_digest: nil, created_at: nil, updated_at: nil>
u.username = 'earl'
# => "earl"
u.password_digest = BCrypt::Password.create('i_love_breakfast')
# => "password digest hash"
u.save
u.password_digest

# Verifying a password
u = User.first
BCrypt::Password.new(u.password_digest).is_password?('i_love_breakfast')
# u.password_digest is set to a string stored in the DB
# We want to get a BCrypt::Password object back from the digest

# --------------------- Write User#password= And User#is_password? ---------------------
class User < ApplicationRecord
  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end

# Creating new users
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
# will call the setter method password= which uses the digest

# Validating User
class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password_digest, presence: { message: 'Password can\'t be blank' }
  validates :password, length: { minimum: 6, allow_nil: true }

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end

u.valid?

#--------------------- Phase 4 - Creating Sessions ---------------------
# Add a session resource to the routes file.
resource :session, only: [:new, :create, :destroy]

# At this point in time, we use resource instead of resources because we are only allowing
# the user to have one session at a time. This means several things:
# 1. a user can only be logged in on one device at a time
# 2. we do not need a table for session
# 3. when we create and destroy a session, we do not need to provide an id
# 4. the routes will look like this
GET      /session/new   sessions#new
POST     /session       sessions#create
DELETE   /session       sessions#destroy

# Generate a SessionsController.
# Write a new form so that the user can fill out their username/password:

# <!-- app/views/sessions/new.html.erb -->
#
# <h1>Log in!</h1>
#
# <form action="/session" method="POST">
#   <input
#     type="hidden"
#     name="authenticity_token"
#     value="<%= form_authenticity_token %>">
#
#   <label for="user_username">Username</label>
#   <input type="text" name="user[username]" id="user_username">
#
#   <br />
#
#   <label for="user_password">Password</label>
#   <input type="password" name="user[password]" id="user_password">
#
#   <br />
#
#   <input type="submit" value="Log in!">
# </form>

# Adding find_by_credentials to User
class User < ApplicationRecord
  # ...

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  # ...
end

# Now in the SessionsController
class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render json: 'Credentials were wrong'
    else
      render json: "Welcome back #{user.username}!"
    end
  end

  def new
  end
end

# Now setting the session
# Add a UsersController#show

# <!-- app/views/users/show.html.erb -->
# <h1><%= @user.username %></h1>
# <p>Hello, dear user!</p>


# Add session_token to User
class AddSessionTokenToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :session_token, :string, null: false
    add_index :users, :session_token, unique: true
  end
end

class User < ApplicationRecord
  validates :session_token, presence: true
  after_initialize :ensure_session_token

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    # we must be sure to use the ||= operator instead of = or ||, otherwise
    # we will end up with a new session token every time we create
    # a new instance of the User class. This includes finding it in the DB!
    self.session_token ||= self.class.generate_session_token
  end
end

# Setting the session in ApplicationController
class ApplicationController < ActionController::Base
  helper_method :current_user # This makes current_user available in all views

  def login!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end

  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end
end

class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render json: 'Credentials were wrong'
    else
      login!(user)
      redirect_to user_url(user)
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
  # ...
end

class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]
  # before_action :require_no_user!, only: [:create, :new]

  def create
    @user = User.new(params[:user])

    if @user.save
      login!(@user)
      redirect_to user_url(@user)
    else
      render json: @user.errors.full_messages
    end
  end

  # ...
end

#------------------ Phase VI: Using The current_user ------------------
<!-- app/views/layouts/application.html.erb -->

<!-- ... -->
<% if !current_user.nil? %>
  <ul>
    <li>Logged in as: <%= current_user.username %></li>
    <li>
      <form action="<%= session_url %>" method="POST">
        <input type="hidden"
               name="authenticity_token"
               value="<%= form_authenticity_token %>">
        <input type="hidden" value="delete" name="_method" />
        <input type="submit" value="Logout" />
      </form>
    </li>
  </ul>
<% end %>

<%= yield %>

</body>
</html>
