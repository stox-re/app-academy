# Generate a mailer
#$ rails generate mailer UserMailer

#create  app/mailers/user_mailer.rb
#invoke  erb
#create    app/views/user_mailer
#invoke  test_unit
#create    test/functional/user_mailer_test.rb

# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: user.email, subject: 'Welcome to My Awesome Site')
  end

  def reminder_email(user)
    # ...
  end

  # other emails...
end

# You can also set cc and bcc attributes. To send to multiple emails, use an array of email strings.

# app/controllers/users_controller.rb
def create
  u = User.create(user_params)

  msg = UserMailer.welcome_email(u)
  msg.deliver_now

  render :root
end

#<!-- app/views/user_mailer/welcome_email.html.erb -->

<!DOCTYPE html>
<html>
  <head>
    <meta content='text/html; charset=UTF-8' http-equiv='Content-Type' />
  </head>
  <body>
    <h1>Welcome to example.com, <%= @user.name %></h1>
    <p>
      You have successfully signed up to example.com,
      your username is: <%= @user.login %>.<br />
    </p>
    <p>
      To login to the site, just follow this link: <%= @url %>.
    </p>
    <p>Thanks for joining and have a great day!</p>
  </body>
</html>

# Create a text version of the email
#<%# app/views/user_mailer/welcome_email.text.erb %>

# Welcome to example.com, <%= @user.name %>
# ===============================================
#
# You have successfully signed up to example.com,
# your username is: <%= @user.login %>.
#
# To login to the site, just follow this link: <%= @url %>.
#
# Thanks for joining and have a great day!


# When you call the mail method now,
# Action Mailer will detect the two templates (text and HTML) and automatically
# generate a multipart/alternative email; the user's email client will
# be able to choose between the two formats.

# Adding attachments
# app/mailers/user_mailer.rb
def welcome_email
  attachments['filename.jpg'] = File.read('/path/to/filename.jpg')
  # ...
end

# Use letter-opener for testing

# Gemfile
gem 'letter_opener', group: :development
# config/environments/development.rb
config.action_mailer.delivery_method = :letter_opener


