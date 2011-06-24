class UserMailer < ActionMailer::Base
  default :from => "derek@clearview-solutions.net"

  def new_task(user, assignor)
    @user = user
    @assignor = assignor
    mail(:to => user.email,
         :subject => 'You have a new task')
  end


end
