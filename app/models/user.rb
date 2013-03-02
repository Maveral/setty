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
#  slug       :string(255)
#

class User < ActiveRecord::Base
  before_update :last_admin?
    
  extend FriendlyId
  friendly_id :nick, use: :slugged
  attr_accessible :about, :age, :name, :nick, :password, :password_confirmation, :result, :result_confirmation, :role, :avatar
  attr_accessor :result #virtual attribute
  
  has_many :news
  
  validates :nick, :password, :presence => true
  validates :nick, :uniqueness => true
  validates :password, :result, :confirmation => true
    
  def self.getRole
    role = ["admin", "mod", "user", "test"]
  end
  
  def admin?
    self.role == "admin"
  end
  
  def admin_or_mod?
    ["admin", "mod"].include?(self.role)
  end
  
  def last_admin?
    admins = User.where("role = ?", "admin").count
    if admins == 1
      user = User.find_by_role("admin")
      if user.nick == self.nick && user.role == 'admin' && self.role != 'admin'
        self.role = 'admin'
        errors.add(:role, I18n.t('activerecord.errors.models.user.role'))
        false
      end
    end
  end
end