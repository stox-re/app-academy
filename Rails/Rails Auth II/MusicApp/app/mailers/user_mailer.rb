class UserMailer < ApplicationMailer
    default from: 'info@musicapp.com'

  def activation_email(user)
    @user = user
    @activation_url  = activate_users_url + "?activation_token=" + @user.activation_token.to_s
    mail(to: user.email, subject: "Activate your musicApp account")
  end
end
