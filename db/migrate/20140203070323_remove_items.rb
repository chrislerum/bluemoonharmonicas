class RemoveItems < ActiveRecord::Migration
  def up
    drop_table :items
  end

  def down
    raise "cannot"
  end
end
