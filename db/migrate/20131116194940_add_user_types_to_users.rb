class AddUserTypesToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |t|
  		t.references :user_type, polymorphic: true
  	end
  end
end
