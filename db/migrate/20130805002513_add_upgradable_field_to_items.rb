class AddUpgradableFieldToItems < ActiveRecord::Migration
  def change
    add_column :items, :upgradable, :boolean
  end
end
