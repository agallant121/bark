class UserMailer < ApplicationMailer
  def review_email(user)
    @user = user
    mail(to: @user.email, subject: 'You have been reviewed!')
  end
end
