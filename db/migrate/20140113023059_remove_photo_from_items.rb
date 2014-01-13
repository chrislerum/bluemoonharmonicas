class RemovePhotoFromItems < ActiveRecord::Migration
  def up
    remove_column :items, :photo
  end

  def down
  end
end
