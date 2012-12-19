module ApplicationHelper
  def logged?
    if session[:user].nil?
    redirect_to login_path
    else
    @userlogged = User.find_by_nick_and_password(session[:user][:nick], session[:user][:password])
    redirect_to login_path if @userlogged.nil?
    end
  end
  
  def userlogged
    @userlogged ||= session[:user]
  end
end
