# Determine whether current user is an administrator
## Note that, since this can obviously be faked, there are restrictions
## in the controllers.
@admin = (callback) ->
  if $('body').hasClass('admin')
    if callback
      callback()
    else
      true

jQuery ->
  processBlocks()

processBlocks = ->
  # White blocks
  if !supports('box-shadow') || !supports('text-shadow') # Non-CSS3 Browsers
    $('.block.white').each ->
      originalHTML = $(this).html()
      $(this).html ''

      top    = $('<div class="top">')
      main   = $('<div class="main">').append $('<div class="wrap">').html(originalHTML)
      bottom = $('<div class="bottom">')

      $(this).append(top, main, bottom)

  else # The cool browsers
    $('.block.white').addClass 'css3'
    $('.block.white').each ->
      $(this).html "<div class=\"wrap\">#{$(this).html()}</div>"


  # Black blocks
  $('.block.black').each ->
    $(this).html "<div class=\"wrap\">#{$(this).html()}</div>"
