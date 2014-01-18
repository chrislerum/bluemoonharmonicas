class AddDisplayOrderToItemImages < ActiveRecord::Migration
  def change
    add_column :item_images, :display_order, :integer, default: 0
  end
end
