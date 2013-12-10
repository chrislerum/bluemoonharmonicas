class CreateCategoriesItemsJoinTable < ActiveRecord::Migration
  def change
    create_table :categories_items do |t|
      t.references :category
      t.references :item
    end

    Item.all.each do |item|
      item.categories = [Category.find(item.category_id)]
    end

    remove_column :items, :category_id
  end
end
