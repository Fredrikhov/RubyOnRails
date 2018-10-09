class UserMailer < ActionMailer::Base
  default from: "noreply@mydomain.com"

  def registration_confirmation(user)
    @user = user
    mail :to => "#{user.email} <#{user.email}>" , :subject => "Please confirm your registration, please confirm your email."
  end
end