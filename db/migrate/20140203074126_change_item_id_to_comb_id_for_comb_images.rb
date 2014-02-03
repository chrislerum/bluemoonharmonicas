class ChangeItemIdToCombIdForCombImages < ActiveRecord::Migration
  def up
    rename_column :comb_images, :item_id, :comb_id
  end

  def down
    rename_column :comb_images, :comb_id, :item_id
  end
end
