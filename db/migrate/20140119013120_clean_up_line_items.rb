class CleanUpLineItems < ActiveRecord::Migration
  def up
    remove_column :line_items, :variant_id
    remove_column :line_items, :purchasable_id
    remove_column :line_items, :purchasable_type
  end

  def down
  end
end
