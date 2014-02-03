class ChangePriceToPriceCentsInCombs < ActiveRecord::Migration
  def up
    rename_column :combs, :price, :price_cents
  end

  def down
    rename_column :combs, :price_cents, :price
  end
end
