class AddPriceAndQuantityToMany < ActiveRecord::Migration
  def change
    add_column :combs, :price, :integer, null: false, default: 0
    add_column :harmonicas, :price, :integer, null: false, default: 0
    add_column :powder_coated_covers, :price, :integer, null: false, default: 0
    add_column :combs, :quantity, :integer, null: false, default: 0
    add_column :harmonicas, :quantity, :integer, null: false, default: 0
    add_column :powder_coated_covers, :quantity, :integer, null: false, default: 0
  end
end
