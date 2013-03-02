class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :password
      t.string :name
      t.string :age
      t.text :about

      t.timestamps
    end
  end
end
