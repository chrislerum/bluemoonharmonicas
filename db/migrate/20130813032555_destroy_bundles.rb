class DestroyBundles < ActiveRecord::Migration
  def change
    drop_table :bundles
    drop_table :bundles_items
  end
end
