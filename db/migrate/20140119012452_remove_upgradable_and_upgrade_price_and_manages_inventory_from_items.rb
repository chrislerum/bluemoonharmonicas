class RemoveUpgradableAndUpgradePriceAndManagesInventoryFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :manages_inventory
    remove_column :items, :upgradable
    remove_column :items, :upgrade_price
  end

  def down
  end
end
