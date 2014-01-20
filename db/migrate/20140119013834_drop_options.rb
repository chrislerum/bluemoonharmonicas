class DropOptions < ActiveRecord::Migration
  def up
    drop_table :options
  end

  def down
  end
end
