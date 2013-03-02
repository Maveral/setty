class UsersController < ApplicationController
  before_filter :logged?, :except => [:login, :auth, :index, :show, :create]
  
  def index
    @users = User.find(:all, :order => :nick)
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
    math_captcha
  end
  
  def create
    params[:user][:result_confirmation] = session[:captcha_result]
    params[:user][:result] = params[:user][:result].to_f
    @user = User.new(params[:user])
    if !@user.valid? || !@user.save
      math_captcha
      @user.result = nil
      render :new
    else
      redirect_to user_path(@user)
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != userlogged then redirect_to user_path(@user) unless admin_user_permission? end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      session[:user] = @user
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def destroy
    session[:user], session[:back] = nil, nil
    redirect_to users_path
  end
  
  def login
    @user = User.new
    if userlogged then redirect_to user_path(userlogged) end
  end

  def auth
    @user = User.find_by_nick_and_password(params[:user][:nick], params[:user][:password])
    if @user
      session[:user] = @user
      session[:back] ? (redirect_to session[:back]) : (redirect_to user_path(@user))
    else
      redirect_to :login
      flash[:notice] = t(:login_error)
    end
  end
  
  private
  
  def math_captcha
    @symbols_tab = ["*", "/", "+", "-"]
    @symbol = @symbols_tab[rand(4)]
    @numbers = []
    4.times do |x| @numbers << 1 + rand(9) end
    @fraction1 = @numbers[0] / @numbers[1].to_f
    @fraction2 = @numbers[2] / @numbers[3].to_f
    
    if @symbol == "*"
      session[:captcha_result] = (@fraction1 * @fraction2).round(2)
    elsif @symbol == "/"
      session[:captcha_result] = (@fraction1 / @fraction2).round(2)
    elsif @symbol == "+"
      session[:captcha_result] = (@fraction1 + @fraction2).round(2)
    else
      session[:captcha_result] = (@fraction1 - @fraction2).round(2)
    end

  end
  
end