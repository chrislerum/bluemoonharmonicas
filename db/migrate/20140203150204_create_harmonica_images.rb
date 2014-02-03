class CreateHarmonicaImages < ActiveRecord::Migration
  def change
    create_table :harmonica_images do |t|
      t.string :photo
      t.integer :harmonica_id
      t.integer :display_order

      t.timestamps
    end
  end
end
