class AddIndexToPosition < ActiveRecord::Migration
  def change
    add_index :links, :position
  end
end
