class AddHarpModelIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :harp_model_id, :integer
    add_index :items, :harp_model_id
  end
end
