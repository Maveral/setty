class NewsController < ApplicationController
  before_filter :logged?, :admin_or_mod_permission?, :only => [:new, :edit]

  def index
    @news = News.paginate(:page => params[:page], :per_page => 5).all(:order => "created_at DESC")
  end
  
  def new
    if userlogged.nil? then redirect_to login_path end
    @news = News.new
  end

  def create
    @news = News.new(params[:news])
    if !@news.valid? || !@news.save
      render :new
    else
      redirect_to news_index_path
    end
  end
  
  def edit
    @news = News.find(params[:id])
  end
  
  def update
    @news = News.find(params[:id])
    if @news.update_attributes(params[:news])
      redirect_to news_index_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @news = News.find(params[:id])
    redirect_to news_index_path if @news.destroy
  end

end