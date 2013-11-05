class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :zip_code, :string
    add_column :users, :type_of_user, :string
    add_column :users, :user_website, :string
  end
end
