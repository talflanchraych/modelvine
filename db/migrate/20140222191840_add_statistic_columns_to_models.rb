class AddStatisticColumnsToModels < ActiveRecord::Migration
  def change
  	add_column :models, :measurements, :string
  	add_column :models, :cup, :string
  	add_column :models, :dress_size, :string
  	add_column :models, :shoe_size, :string
  end
end
