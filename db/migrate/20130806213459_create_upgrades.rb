class CreateUpgrades < ActiveRecord::Migration
  def change
    create_table :upgrades do |t|
      t.references :variant
      t.references :line_item
      t.string :upgrade_type

      t.timestamps
    end
    add_index :upgrades, :variant_id
    add_index :upgrades, :line_item_id
  end
end
