class AddManageInventoryOptionToItems < ActiveRecord::Migration
  def change
    add_column :items, :manages_inventory, :boolean
  end
end
