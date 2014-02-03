class CreatePowderCoatedCovers < ActiveRecord::Migration
  def change
    create_table :powder_coated_covers do |t|
      t.string :name
      t.text :description
      t.integer :brand_id
      t.integer :model_id
      t.integer :color_id

      t.timestamps
    end
  end
end
