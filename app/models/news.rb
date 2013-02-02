class News < ActiveRecord::Base
  attr_accessible :category, :content, :title, :user_id
  
  validates :title, :content, :category, :presence => true
end
