class DropUpgrades < ActiveRecord::Migration
  def up
    drop_table :upgrades
  end

  def down
  end
end
