class UsersController < ApplicationController
  before_filter :logged?, :except => [:login, :auth, :index, :show, :new, :create]
  
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def new
    if userlogged.nil? then redirect_to login_path end
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if !@user.valid? || !@user.save
      render :new
    else
      redirect_to user_path(@user)
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
    @user = User.new
    if !userlogged.nil? then redirect_to user_path(userlogged) end
  end

  def auth
    @user = User.find_by_nick_and_password(params[:user][:nick], params[:user][:password])
    if @user
      session[:user] = @user
      redirect_to users_path
    else
      redirect_to :login
      flash[:notice] = t(:login_error)
    end
  end
  
end