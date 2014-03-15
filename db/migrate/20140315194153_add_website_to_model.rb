class AddWebsiteToModel < ActiveRecord::Migration
  def change
    add_column :models, :website, :string
  end
end
