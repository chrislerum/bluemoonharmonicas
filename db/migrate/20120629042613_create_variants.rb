class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.references :option_value
      t.references :item
    end
    add_index :variants, :option_value_id
  end
end
