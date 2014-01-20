class LineItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :item

  attr_accessible :quantity, :cart, :cart_id, :special_instructions, :description, :item_id

  validates :unit_price, presence: true, numericality: true
  validates :cart_id, presence: true
  validates :quantity, numericality: { only_integer: true }, inclusion: { in: 1..999 }

  before_save :combine_if_duplicate
  before_save :fix_stock

  default_scope order('id DESC')

  def stock_valid?
    quantity.to_i <= amount_in_stock.to_i
  end

  def fix_stock
    if !stock_valid?
      if amount_in_stock > 0
        write_attribute(:quantity, amount_in_stock)
        save
      else
        destroy
      end
      false
    else
      true
    end
  end

  def amount_in_stock
    Item.find(item_id).quantity
  end

  def combine_if_duplicate
    duplicate = self.cart.line_items.find_by_item_id(item_id)
    if duplicate && duplicate != self
      write_attribute(:quantity, quantity + duplicate.quantity)
      duplicate.destroy
    end
  end

  def total_price
    unit_price * quantity
  end
end
