class AddColorIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :color_id, :int
  end
end
