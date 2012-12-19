class UsersController < ApplicationController
  before_filter :logged?, :except => [:login, :auth, :index, :show, :new, :create]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    #if !userlogged.nil? then redirect_to user_path(userlogged) end
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
    if @user != userlogged then redirect_to user_path(@user) end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def destroy
    session[:user] = nil
    redirect_to users_path
  end
  
  def login
    if !userlogged.nil? then redirect_to user_path(userlogged) end
    @user = User.new
  end

  def auth
    @user = User.find_by_nick_and_password(params[:users][:nick], params[:users][:password])
    if @user.nil?
      render 'login'
    else
      session[:user] = @user
      redirect_to users_path
    end
  end
  
end