class Variant < ActiveRecord::Base
  belongs_to :option_value
  belongs_to :item

  has_many :line_items
  has_many :upgrades

  attr_accessible :quantity, :option_value, :item

  def option
    option_value.option
  end

  def remove(amount)
    quantity = quantity-amount
    save!
  end

  # Handle case when quantity is set to a negative number.
  def quantity=(quantity)
    quantity = quantity.to_i
    write_attribute(:quantity, [quantity, 0].max)
  end

end
