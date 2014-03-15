class AddImageDimensionsToUserPhotos < ActiveRecord::Migration
  def change
  	add_column :user_photos, :photo_width, :integer, null: false, default: 300
  	add_column :user_photos, :photo_height, :integer, null: false, default: 300
  end
end
