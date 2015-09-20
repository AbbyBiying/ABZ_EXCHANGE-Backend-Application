class UserMailer < ActionMailer::Base
  default from: "abbyzhangnyc@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'https://abz-exchange.herokuapp.com/session/new'
    mail(to: @user.email, subject: 'Welcome to ABZ EXCHANGE!')
  end
end
