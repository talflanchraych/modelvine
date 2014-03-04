class AddUsedByToAccessCode < ActiveRecord::Migration
  def change
  	add_column :access_codes, :used_by, :integer
  	rename_column :access_codes, :access_code, :code
  end
end
