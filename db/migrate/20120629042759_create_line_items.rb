class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.float :unit_price
      t.references :product
      t.references :cart
      t.integer :quantity

      t.timestamps
    end
    add_index :line_items, :product_id
    add_index :line_items, :cart_id
  end
end
