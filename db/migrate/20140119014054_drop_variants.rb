class DropVariants < ActiveRecord::Migration
  def up
    drop_table :variants
  end

  def down
  end
end
