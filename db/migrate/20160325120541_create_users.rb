class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_name, null: false, uniqueness: true, index: true
      t.string :email, null: false
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
