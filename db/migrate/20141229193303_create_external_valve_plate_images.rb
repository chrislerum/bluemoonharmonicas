class CreateExternalValvePlateImages < ActiveRecord::Migration
  def change
    create_table :external_valve_plate_images do |t|
      t.string :photo
      t.integer :external_valve_plate_id
      t.integer :display_order

      t.timestamps
    end
  end
end
