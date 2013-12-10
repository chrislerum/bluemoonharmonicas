class CreateOptionValues < ActiveRecord::Migration
  def change
    create_table :option_values do |t|
      t.string :title
      t.float :price_diff
      t.references :option

      t.timestamps
    end
    add_index :option_values, :option_id
  end
end
