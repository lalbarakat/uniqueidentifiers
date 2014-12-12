class UserNotifier < ActionMailer::Base
  default from: "system@vizapex.com"
  
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email, :subject => 'Thanks for signing up for our app' )
  end
  
  # send a warning email to the student that their items are about due
  def send_warning_email(student, items)
    @student = student
    @items = items
    mail( :to => @student.email, :subject => 'Items Due Soon' )
  end
end
