module ItemsHelper
  def disabled_for_quantity(quantity)
    quantity < 1 ? 'disabled="disabled"' : ""
  end
end
