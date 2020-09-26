# Model Level Validation
class User < ApplicationRecord
  validates :username, :password, presence: true
  validates :password, length: { minimum: 6 }
end

u = User.new(username: 'Billy Bob')
u.save

# Using flash
def create
  @user = User.new(params[:user])
  if @user.save
    flash[:notice] = 'Success!'
    redirect_to user_url(@user)
  else
    # sweet! now my flash.now[:errors] will be full of informative errors!
    flash.now[:errors] = @user.errors.full_messages
    render :new
  end
end

# <!-- layouts/_errors.html.erb -->
# <% if flash.now[:errors] %>
#   <% flash.now[:errors].each do |error| %>
#    <%= error %><br />
#   <% end %>
# <% end %>
#
# <!-- views/users/new.html.erb -->
# <%= render partial: 'layouts/errors' %>
#
# <!-- views/users/edit.html.erb -->
# <%= render partial: 'layouts/errors' %>
