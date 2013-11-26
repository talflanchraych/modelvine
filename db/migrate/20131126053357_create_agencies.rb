class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
    	t.text :bio
    	t.string :website
    end
  end
end
