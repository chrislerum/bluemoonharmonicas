class AddUpgradePriceToItems < ActiveRecord::Migration
  def change
    add_column :items, :upgrade_price, :float
  end
end
