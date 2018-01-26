class UserMailer < ActionMailer::Base
  default from: "abbyzhangnyc@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://www.abzexchange.com/session/new'
    mail(to: @user.email,
      subject: 'Welcome to ABZ EXCHANGE!')
  end

  def invite_email(user, sender)
    @user = user
    @sender = sender
    @url  = 'http://www.abzexchange.com/session/new'
    mail(to: @user.email,
      subject: "You've been invited to ABZ EXCHANGE!")
  end
end
