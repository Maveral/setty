# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  nick       :string(255)
#  password   :string(255)
#  name       :string(255)
#  age        :string(255)
#  about      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base  
  extend FriendlyId
  friendly_id :nick, use: :slugged
  attr_accessible :about, :age, :name, :nick, :password, :password_confirmation, :result, :result_confirmation
  attr_accessor :result #virtual attribute
  
  validates :nick, :password, :presence => true
  validates :nick, :uniqueness => true
  validates :password, :result, :confirmation => true
end