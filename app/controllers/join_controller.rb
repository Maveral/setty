class JoinController < ApplicationController
  def new
    @newguy = User.new
    math_captcha
  end
  
  def create
    params[:user][:result_confirmation] = session[:captcha_result]
    if params[:user][:result].include?(",") then params[:user][:result] = params[:user][:result].gsub(",", ".") end
    params[:user][:result] = params[:user][:result].to_f
    params[:user][:password] = "psi"
    @newguy = User.new(params[:user])
    if !@newguy.valid?
      math_captcha
      @newguy.result = nil
      render :new
    else
      JoinMailer.join_email(@newguy).deliver
      redirect_to new_join_path, flash: {notice: t(:mail_success)}
    end
  end
end