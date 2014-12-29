class CreateSub30CustomizationKits < ActiveRecord::Migration
  def change
    create_table :sub_30_customization_kits do |t|
      t.string   :name
      t.text     :description
      t.integer  :model_id,          :default => 0, :null => false
      t.integer  :price_cents,      :default => 0, :null => false
      t.integer  :quantity,         :default => 0, :null => false
      t.timestamps
    end
  end
end
