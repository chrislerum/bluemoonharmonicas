class AddItemInventoryManagement < ActiveRecord::Migration
  def change
    remove_column :items, :available
    add_column :items, :quantity, :integer
  end
end
