# == Schema Information
#
# Table name: news
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  category   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class News < ActiveRecord::Base
  attr_accessible :category, :content, :title, :user_id
  
  belongs_to :user
  
  validates :title, :content, :category, :presence => true
end
