class CreateAccessCodes < ActiveRecord::Migration
  def change
    create_table :access_codes do |t|
    	t.string :access_code
    	t.boolean :used, default: false
    	t.integer :user_id

    	t.timestamps
    end
  end
end
