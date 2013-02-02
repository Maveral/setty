class NewsController < ApplicationController

  def index
    @news = News.all
  end

  def show

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
    
  end
  
  def update
    
  end
  
  def destroy
    
  end

end