class RemoveTableCategories < ActiveRecord::Migration
  def up
    remove_index :categories, :position
    drop_table :categories
    drop_table :categories_items
  end

  def down
  end
end
