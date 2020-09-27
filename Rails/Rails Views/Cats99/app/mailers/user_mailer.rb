class UserMailer < ApplicationMailer
  default from: 'info@cats99.com'

  def welcome_email(user)
    @user = user
    @url  = 'https://cats99.com/login'
    mail(to: user.username, subject: 'Welcome to the cats rental site!')
  end
end
