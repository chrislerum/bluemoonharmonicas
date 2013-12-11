class ChangeLineItemsAssociationToPolymorphic < ActiveRecord::Migration
  def change
    change_table :line_items do |t|
      t.remove :item_id

      t.column :purchasable_id, :integer
      t.column :purchasable_type, :string

      t.index :purchasable_id
      t.index :purchasable_type
    end
  end
end
