class CreatePhotographers < ActiveRecord::Migration
  def change
	create_table :photographers do |t|
	    t.string :model_mayhem
	    t.string :website
		t.text :bio

		t.timestamps
	end
  end
end
