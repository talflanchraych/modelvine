class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
    	t.date :birth_date
    	t.string :gender
    	t.float :height
    	t.integer :weight
    	t.string :ethnicity
    	t.string :eye_color
    	t.string :hair_color
        t.string :model_mayhem
    	t.text :bio
   
    	t.timestamps
    end
  end
end
