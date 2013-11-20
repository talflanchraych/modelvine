class CreateUserPhotos < ActiveRecord::Migration
  def change
    create_table :user_photos do |t|
      t.string :caption
      t.integer :user_id
      t.attachment :photo

      t.timestamps
    end
    add_index :user_photos, [:user_id, :created_at]
  end
end
