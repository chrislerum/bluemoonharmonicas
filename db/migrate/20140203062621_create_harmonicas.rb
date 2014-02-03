class CreateHarmonicas < ActiveRecord::Migration
  def change
    create_table :harmonicas do |t|
      t.string :name
      t.text :description
      t.integer :brand_id
      t.integer :model_id
      t.integer :key_id

      t.timestamps
    end
  end
end
