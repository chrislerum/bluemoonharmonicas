class CreateCombs < ActiveRecord::Migration
  def change
    create_table :combs do |t|
      t.string :name
      t.text :description
      t.integer :brand_id
      t.integer :model_id
      t.integer :material_type_id
      t.integer :color_id

      t.timestamps
    end
  end
end
