class RemoveHarpModelIdFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :harp_model_id
  end

  def down
    add_column :items, :harp_model_id, :integer
  end
end
