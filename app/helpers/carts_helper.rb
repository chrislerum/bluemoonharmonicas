module CartsHelper
  def shipping_costs(cart)
    [true, false].map do |val|
      number_to_currency(Order.calculate_shipping_price(cart.number_of_items, domestic: val))
    end.join(" | ")
  end

  def total_costs(cart)
    [true, false].map do |val|
      number_to_currency(Order.calculate_shipping_price(cart.number_of_items, domestic: val) + cart.total_price)
    end.join(" | ")
  end
end
