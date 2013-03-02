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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
