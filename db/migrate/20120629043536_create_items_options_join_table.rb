class CreateItemsOptionsJoinTable < ActiveRecord::Migration
  def change
    create_table :items_options, :id=>false do |t|
      t.integer :item_id
      t.integer :option_id
    end

    add_index :items_options, [:item_id, :option_id]
  end
end
