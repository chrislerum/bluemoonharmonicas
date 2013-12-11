# Script to change product header based on line number
# And to handle quantity validation
jQuery ->
  $('#item_option_ids').chosen()

  products.init()

  # Special dropdown boxes
  products.update_dropdowns()
  $('select').change( ->( $(this).prev().html($(this).find(':selected').html()) ) )

products = 
  init: ->
    if (form = $('#add_to_cart')).length > 0
      @control_quantity(form)
      $('#quantity, select').change ->
        products.control_quantity(form)

    if (header = $('#product_information h1')).length > 0
      @get_number_of_lines(header)

  update_dropdowns: (text="") ->
    $('p.select').html ->
      text || $(this).next().find('option:selected').html()

  get_number_of_lines: (block) ->
    y = lines = 0

    original_html = block.html()
    block.html "<span>#{original_html.split(' ').join('</span> <span>')}</span>"

    block.find('span').each ->
      position = $(this).position()

      initial = y
      y = Math.max( y, parseInt(position.top) )

      if y > initial
        lines++

    block.parent().addClass("lines_#{lines}")
    block.html original_html

  control_quantity: (form) ->
    quantity_arr = []
    $('select').each ->
      quantity_arr.push parseInt($(this).find(':selected').attr('data-quantity'))

    quantityField = $('#quantity')
    submitButton = $('#add-button button')

    # JavaScript version of array.min
    # The sorting function is required because JS uses lexicographical sorting
    amount_in_stock = quantity_arr.sort((a, b) -> (a - b))[0]

    # Either way, validate the quantity.
    if parseInt(quantityField.val()) > amount_in_stock || parseInt(quantityField.val()) < 1 || isNaN(quantityField.val())
      quantityField.addClass 'error'
      submitButton.attr 'disabled', 'disabled'

    else
      quantityField.removeClass 'error'
      submitButton.removeAttr 'disabled'
