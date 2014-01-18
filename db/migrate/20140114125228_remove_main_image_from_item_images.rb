class RemoveMainImageFromItemImages < ActiveRecord::Migration
  def up
    remove_column :item_images, :main_image
  end

  def down
    add_column :item_images, :main_image, :boolean, default: false
  end
end
