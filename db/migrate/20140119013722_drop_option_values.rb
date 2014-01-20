class DropOptionValues < ActiveRecord::Migration
  def up
    drop_table :option_values
  end

  def down
  end
end
