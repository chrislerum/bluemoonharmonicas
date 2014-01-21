class OrderPdf < Prawn::Document
  def initialize(order, view)
    super(top_margin: 100)
    @order = order
    @view = view

    header
    order_number
    order_time

    thankyou_message

    line_items

    order_total

    ship_to

    contact_info
  end

  def header
    position_y = cursor
    image "#{Rails.root}/app/assets/images/bmh_print.png", position: :left,
                                                           width: 600,
                                                           at: [-120, cursor+40]
    move_down 120
  end

  def order_number
    text "Order \##{@order.order_number}", size: 20

    self.line_width = 0.5
    line [0, cursor], [540, cursor], width: 0.5
    stroke

    move_down 40
  end

  def order_time
    move_up 55

    text "Placed on #{time_in_words}", align: :right, inline_format: true

    move_down 10
  end

  def thankyou_message
    msg = <<-MSG
Thank you for your order#{@order.first_name.present? ? ", #{@order.first_name}" : nil}. \
We appreciate your business. We are committed to delivering high quality and \
superior customer service. We proudly stand behind all our products with a \
<b>100% Satisfaction Guarantee</b>. If, for any reason, you are not completely \
satisfied with your purchase, we want to know about it. We will do everything in \
our power to make it right; including, if necessary, issuing a full refund of \
your purchase price and shipping cost.
    MSG

    text msg, size: 10, inline_format: true, align: :justify

    move_down 40
  end

  def time_in_words(time = @order.created_at)
    time.strftime("<b>%-m/%-d/%-y</b> at <b>%-I:%M%p %Z</b>")
  end

  def line_items
    table line_item_rows do
      self.column_widths = [360, 60, 60, 60]
      self.row_colors    = ['FFFFFF', 'F1F1F1']
      self.cell_style    = {borders: [],
                            border_width: 0.5,
                            inline_format: true}
                            # TODO: fix prawn border_lines: [:dotted]}

      row(0).font_style  = :bold
      row(0).size        = 10
      column(1..3).align = :right
      column(2).align    = :center
    end

    move_down 40
  end

  def line_item_rows
    [["Item", "Unit Price", "Quantity", "Total Price"]] +
      @order.cart.line_items.map do |line_item|
        [line_item_name(line_item),
         price(line_item.unit_price),
         line_item.quantity,
         price(line_item.total_price)]
      end
  end

  def line_item_name(line_item)
    ["<b>#{line_item.item.name}</b>",
     "<font size='10'>Special instructions: #{line_item.special_instructions || "--"}</font>"].join("\n")
  end

  def order_total
    text "<b>Shipping:</b> #{price(@order.shipping_price)}", inline_format: true, align: :right
    move_down 10
    text "<b>Total:</b> #{price(@order.price_with_shipping)}", inline_format: true, align: :right
    move_up 40
  end


  def ship_to
    text "Ship to:", style: :bold

    text [
        @order.address['Name'],
        @order.address['Street1'],
        @order.address['Street2'],
        "#{@order.address['CityName']}, #{@order.address['StateOrProvince']} #{@order.address['PostalCode']}"
      ].keep_if(&:present?).join("\n")

    move_down 20
  end


  def price(num)
    @view.number_to_currency(num)
  end


  def contact_info
    msg = <<-MSG
Blue Moon Harmonicas, LLC
P.O. Box 14401
Clearwater, FL 33766
www.BlueMoonHarmonicas.com
info@bluemoonharmonicas.com
    MSG

    width = 200
    text_box msg, at: [540-width, cursor], width: width, inline_format: true, align: :right
  end
end
