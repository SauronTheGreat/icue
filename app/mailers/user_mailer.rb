class UserMailer < ActionMailer::Base
  def registration_confirmation(user)
    @resourse=user
    mail(:to => user.email, :subject => "Registered", :from => "rushbahhathi@gmail.com")

  end
end
