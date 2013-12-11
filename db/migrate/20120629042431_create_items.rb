class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :shortname
      t.text :description
      t.float :price

      t.timestamps
    end
  end
end
