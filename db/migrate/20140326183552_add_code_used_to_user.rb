class AddCodeUsedToUser < ActiveRecord::Migration
  def change
    add_column :users, :code_used, :string
  end
end
