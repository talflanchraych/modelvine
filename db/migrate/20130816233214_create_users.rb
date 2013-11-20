class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :zip_code
      t.string :type_of_user
      t.string :user_website
      t.boolean :admin, default: false
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end