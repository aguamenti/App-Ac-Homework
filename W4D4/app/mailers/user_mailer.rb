class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = 'localhost:3000/session/new'
    mail(to: user.email, subject: 'Welcome to 99Cats!')
  end
end
