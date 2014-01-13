class CreateItemImages < ActiveRecord::Migration
  def change
    create_table :item_images do |t|
      t.string :photo
      t.integer :item_id
      t.boolean :main_image, default: false

      t.timestamps
    end
  end
end
