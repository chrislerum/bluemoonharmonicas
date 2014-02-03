class ChangePriceToPriceCentsInHarmonicasAndCovers < ActiveRecord::Migration
  def up
    rename_column :harmonicas, :price, :price_cents
    rename_column :powder_coated_covers, :price, :price_cents
  end

  def down
    rename_column :harmonicas, :price_cents, :price
    rename_column :powder_coated_covers, :price_cents, :price
  end
end
