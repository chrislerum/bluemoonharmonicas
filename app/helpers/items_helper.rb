module ItemsHelper
  def disabled_for_quantity(quantity)
    quantity < 1 ? 'disabled="disabled"' : ""
  end

  def upgrade_field_for(item, type)
    case type
      when :comb
        option_groups = item.comb_upgrades.map do |category, variants|
          options = variants.map do |variant|
            "<option #{disabled_for_quantity(variant.quantity)} value=\"#{variant.id}\" data-quantity=\"#{variant.quantity}\">#{option_value_title(variant, item)}</option>"
          end.join("\n")

          code = <<-code
            <optgroup label="#{category.name}">
              #{options}
            </optgroup>
          code
        end.join("\n")

        code = <<-code
          <label>Comb Upgrade</label>
          <p class="select"></p>
          <select name="line_item[comb_upgrade]">
            #{option_groups}
          </select>
        code

      when :cover_plate
        options = item.cover_plate_upgrades.map do |variant|
          "<option #{disabled_for_quantity(variant.quantity)} value=\"#{variant.id}\" data-quantity=\"#{variant.quantity}\">#{option_value_title(variant, item)}</option>"
        end.join("\n")

        code = <<-code
          <label>Cover Plate Upgrade</label>
          <p class="select"></p>
          <select name="line_item[cover_plate_upgrade]">
            #{options}
          </select>
        code
    end

    content_tag :div, code.html_safe, class: "field"
  end

  def option_value_title(variant, base_item)
    price_diff = variant.item.upgrade_price

    # NOTE
    # Hard-coded exceptions to the pricing model below
    if base_item.id == 61 || base_item.id == 71
      if variant.option_value.option_id == 5
        price_diff = 15
      else
        price_diff = 0
      end
    end

    price_diff_string = case
      when price_diff.to_i > 0
        "+#{number_to_currency price_diff}"
      when price_diff.to_i == 0
        ""
      when price_diff.to_i < 0
        "-#{number_to_currency price_diff}"
    end

    "#{variant.option_value.title} (#{variant.quantity} in stock) #{price_diff_string}"
  end

  def process_option_title(title)
    raw title.sub(/\*(.+)\*/, '<em>\1</em>')
  end

  def inventory_or_price_string_for(item)
    if item.manages_inventory? && item.quantity > 0
      "#{item.quantity} left &mdash; #{number_to_currency item.price}".html_safe
    elsif item.manages_inventory?
      "Out of stock"
    else
      number_to_currency item.price
    end
  end
end
