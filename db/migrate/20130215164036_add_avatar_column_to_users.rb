class AddAvatarColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar, :integer, :default => 1
  end
end
