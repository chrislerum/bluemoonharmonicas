class CreateHarpModels < ActiveRecord::Migration
  def change
    create_table :harp_models do |t|
      t.string :name
      t.string :brand

      t.timestamps
    end
  end
end
