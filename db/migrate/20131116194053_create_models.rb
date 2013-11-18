class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
    	t.date :birth_date
    	t.string :gender
    	t.integer :height_feet
        t.integer :height_inches
    	t.integer :weight
    	t.string :ethnicity
    	t.string :eye_color
    	t.string :hair_color
    	t.text :bio
   
    	t.timestamps
    end
  end
end
