class UserMailer < ActionMailer::Base
  default from: 'admin@fleetonrails.eu'

  def password_reset(user)
    @user = user

    mail to: @user.email, :subject => 'Password Reset'
  end
end
