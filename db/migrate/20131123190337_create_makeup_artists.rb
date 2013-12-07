class CreateMakeupArtists < ActiveRecord::Migration
  def change
    create_table :makeup_artists do |t|
    	t.string :model_mayhem
	    t.string :website
		  t.text :bio

		t.timestamps
    end
  end
end
