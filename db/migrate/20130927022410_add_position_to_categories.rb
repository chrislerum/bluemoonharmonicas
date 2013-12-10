class AddPositionToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :position, :integer
    add_index :categories, :position
  end
end
