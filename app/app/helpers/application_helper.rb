module ApplicationHelper
  def logged?
    if session[:user].nil?
      session[:back] = request.fullpath
      redirect_to login_path
    else
      @userlogged = User.find_by_nick_and_password(session[:user][:nick], session[:user][:password])
      redirect_to login_path if @userlogged.nil?
    end
  end
  
  def userlogged
    @userlogged ||= session[:user]
  end
  
  def admin_user_permission?
    userlogged.admin?
  end
  
  def admin_or_mod_permission?
    unless userlogged.admin_or_mod?
      redirect_to users_path
    end
  end
  
end