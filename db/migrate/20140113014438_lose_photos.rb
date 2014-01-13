class LosePhotos < ActiveRecord::Migration
  def up
    remove_index :photos, :photographable_id
    remove_index :photos, :photographable_type
    drop_table :photos
  end

  def down
  end
end
