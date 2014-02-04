class MakeLineItemsPolymorphic < ActiveRecord::Migration
  def up
    rename_column :line_items, :comb_id, :purchasable_id
    add_column :line_items, :purchasable_type, :string
  end

  def down
    rename_column :line_items, :purchasable_id, :comb_id
    remove_column :line_items, :purchasable_type
  end
end
