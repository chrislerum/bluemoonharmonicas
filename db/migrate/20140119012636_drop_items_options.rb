class DropItemsOptions < ActiveRecord::Migration
  def up
    drop_table :items_options
  end

  def down
  end
end
