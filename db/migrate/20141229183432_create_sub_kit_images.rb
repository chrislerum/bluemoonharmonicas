class CreateSubKitImages < ActiveRecord::Migration
  def change
    create_table :sub_kit_images do |t|
      t.string :photo
      t.integer :sub_kit_id
      t.integer :display_order

      t.timestamps
    end
  end
end
