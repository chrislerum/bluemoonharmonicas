class MoveItemsToCombsWherePossible < ActiveRecord::Migration
  def up
    items = Item.all
    items.each do |item|
      comb = Comb.new(name: item.name, description: item.description, price: item.price*100, quantity: item.quantity)
      comb.save
    end
  end

  def down
    raise "cannot return from this"
  end
end
