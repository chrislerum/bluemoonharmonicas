class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  belongs_to :user
  has_one :order

  def total_price
    line_items.to_a.sum(&:total_price)
  end

  def assign_to_user(user)
    user_id = user
    save!
  end

  def number_of_items
    line_items.to_a.sum(&:quantity)
  end

  #def update_inventory
    #for line_item in line_items
      #line_item.upgrades.each { |upgrade| upgrade.variant.remove(line_item.quantity) }

      #if line_item.purchasable.manages_inventory?
        #line_item.purchasable.quantity -= line_item.quantity
        #line_item.purchasable.save!
      #else
        #line_item.variant.quantity -= line_item.quantity
        #line_item.variant.save!
      #end
    #end
  #end
end
