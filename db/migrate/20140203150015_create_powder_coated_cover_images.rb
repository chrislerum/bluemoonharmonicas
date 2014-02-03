class CreatePowderCoatedCoverImages < ActiveRecord::Migration
  def change
    create_table :powder_coated_cover_images do |t|
      t.string :photo
      t.integer :powder_coated_cover_id
      t.integer :display_order

      t.timestamps
    end
  end
end
