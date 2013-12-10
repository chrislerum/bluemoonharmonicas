class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :src
      t.string :href
      t.references :item

      t.timestamps
    end
    add_index :photos, :item_id
  end
end
