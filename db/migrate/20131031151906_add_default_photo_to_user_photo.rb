class AddDefaultPhotoToUserPhoto < ActiveRecord::Migration
  def change
    add_column :user_photos, :default_photo, :boolean, default: false
  end
end
