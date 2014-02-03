class RemoveBrandFromModels < ActiveRecord::Migration
  def up
    remove_column :models, :brand
  end

  def down
    add_column :models, :brand, :string
  end
end
