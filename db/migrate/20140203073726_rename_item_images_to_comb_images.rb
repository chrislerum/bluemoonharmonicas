class RenameItemImagesToCombImages < ActiveRecord::Migration
  def up
    rename_table :item_images, :comb_images
  end

  def down
    rename_table :comb_images, :item_images
  end
end
