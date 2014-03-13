class AddMoreColumnToModels < ActiveRecord::Migration
  def change
    add_column :models, :bust, :string
    add_column :models, :waist, :string
    add_column :models, :hips, :string
    remove_column :models, :measurements, :string
  end
end
