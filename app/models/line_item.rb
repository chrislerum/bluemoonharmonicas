class LineItem < ActiveRecord::Base
  belongs_to :purchasable, polymorphic: true
  belongs_to :cart
  belongs_to :variant
  has_many :upgrades

  attr_accessible :quantity, :cart, :purchasable, :purchasable_id, :purchasable_type, :variant_id, :cart_id, :special_instructions, :description, :comb_upgrade, :cover_plate_upgrade
  attr_writer :comb_upgrade, :cover_plate_upgrade

  validates :unit_price, presence: true, numericality: true
  validates :purchasable_id, presence: true
  validates :cart_id, presence: true
  validates :quantity, numericality: { only_integer: true }, inclusion: { in: 1..999 }

  before_save :combine_if_duplicate
  before_save :fix_stock
  before_save :upgrade_price

  default_scope order('id DESC')

  def stock_valid?
    quantity.to_i <= amount_in_stock.to_i
  end

  def comb_upgrade=(value)
    upgrades.new(upgrade_type: 'comb', variant: Variant.find(value))
  end

  def cover_plate_upgrade=(value)
    upgrades.new(upgrade_type: 'cover_plate', variant: Variant.find(value))
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
    if purchasable.manages_inventory?
      purchasable.quantity
    else
      variant.quantity
    end
  end

  def combine_if_duplicate
    if purchasable.manages_inventory?
      duplicate = self.cart.line_items.find_by_purchasable_id(purchasable_id)
    else
      duplicate = self.cart.line_items.find_by_variant_id_and_purchasable_id(variant_id, purchasable_id)
    end
    if duplicate && duplicate != self
      write_attribute(:quantity, quantity + duplicate.quantity)
      duplicate.destroy
    end
  end

  def upgrade_price
    if purchasable.upgradable?
      total_price_diff = upgrades.map do |upgrade|
        if purchasable_id == 61 || purchasable_id == 71
          if upgrade.variant.option_value.option_id == 5
            15
          else 
            0
          end
        else
          upgrade.variant.item.upgrade_price
        end
      end.inject(:+)

      write_attribute(:unit_price, unit_price + total_price_diff)
    end
  end

  def total_price
    unit_price*quantity
  end
end
