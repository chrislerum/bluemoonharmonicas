class AddKeyIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :key_id, :int
  end
end
