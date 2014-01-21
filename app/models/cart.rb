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

  def update_inventory
    for line_item in line_items
      line_item.item.quantity -= line_item.quantity
      line_item.item.save!
    end
  end

  def check_inventory
  end
end
