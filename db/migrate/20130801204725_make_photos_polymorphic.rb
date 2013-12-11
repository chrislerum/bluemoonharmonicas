class MakePhotosPolymorphic < ActiveRecord::Migration
  def change
    change_table :photos do |t|
      t.remove :item_id

      t.column :photographable_id, :integer
      t.index  :photographable_id
      
      t.column :photographable_type, :string
      t.index  :photographable_type
    end
  end
end
