class CreateBundles < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :name
      t.string :shortname
      t.string :price
      t.text :description

      t.timestamps
    end
  end
end
