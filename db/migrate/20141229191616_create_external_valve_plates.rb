class CreateExternalValvePlates < ActiveRecord::Migration
  def change
    create_table :external_valve_plates do |t|
      t.string   :name
      t.text     :description
      t.integer  :model_id,          :default => 0, :null => false
      t.integer  :price_cents,      :default => 0, :null => false
      t.integer  :quantity,         :default => 0, :null => false
      t.timestamps
    end
  end
end
