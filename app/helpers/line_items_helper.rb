module LineItemsHelper
  def variant_id_for (item, option_value)
    v = Variant.find_by_item_id_and_option_value_id(item.id, option_value.id)
    v.id unless v.nil?
  end
  def remaining(item, option_value)
    v = Variant.find_by_item_id_and_option_value_id(item.id, option_value.id)
    v.quantity unless v.nil?
  end
  def remaining_in_words(item, option_value)
    quantity = remaining(item, option_value)
    "("+case quantity
      when 0
        "out of stock"
      when 1..3
        "only #{quantity} left!"
      when 4..999
        "#{quantity} in stock"
    end+")" unless remaining(item, option_value).nil?
  end

  def text_for_upgrade(upgrade)
    case upgrade.upgrade_type
    when "comb"
      "Comb upgrade: #{link_to upgrade.variant.option_value.title, upgrade.variant.item}".html_safe
    when "cover_plate"
      "Cover plate upgrade: #{link_to upgrade.variant.option_value.title, upgrade.variant.item}".html_safe
    end
  end

  def special_instructions(line_item)
    "Special instructions: #{line_item.special_instructions}" if line_item.special_instructions.present?
  end
end
