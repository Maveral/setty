class JoinMailer < ActionMailer::Base
  default :from => "psi@maveral.megiteam.pl"
 
  def join_email(user)
    @newguy = user
    mail(:to => "psi@maveral.megiteam.pl", :subject => "Nowy aplikant")
  end
end