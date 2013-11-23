class AddDefaultPhotoIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :default_photo_id, :integer
  	remove_column :user_photos, :default_photo
  end
end
