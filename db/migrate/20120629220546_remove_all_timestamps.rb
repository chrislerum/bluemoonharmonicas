class RemoveAllTimestamps < ActiveRecord::Migration
  def change
    remove_column :items, :updated_at
    remove_column :items, :created_at

    remove_column :categories, :updated_at
    remove_column :categories, :created_at

    remove_column :line_items, :updated_at
    remove_column :line_items, :created_at

    remove_column :option_values, :updated_at
    remove_column :option_values, :created_at

    remove_column :options, :updated_at
    remove_column :options, :created_at

    remove_column :photos, :updated_at
    remove_column :photos, :created_at
  end
end
