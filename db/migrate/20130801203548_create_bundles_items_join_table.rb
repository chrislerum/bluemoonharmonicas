class CreateBundlesItemsJoinTable < ActiveRecord::Migration
  def change
    create_table :bundles_items do |t|
      t.references :item
      t.references :bundle
    end

    add_index :bundles_items, :item_id
    add_index :bundles_items, :bundle_id
  end
end
