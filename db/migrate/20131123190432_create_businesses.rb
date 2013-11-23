class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
    	t.text :bio
    	t.string :website
    end
  end
end
