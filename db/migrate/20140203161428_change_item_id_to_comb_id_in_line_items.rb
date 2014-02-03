class ChangeItemIdToCombIdInLineItems < ActiveRecord::Migration
  def up
    rename_column :line_items, :item_id, :comb_id
  end

  def down
    rename_column :line_items, :comb_id, :item_id
  end
end
