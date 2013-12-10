$('#photos img').bind 'click', (e) ->
  # Prevent link from processing
  e.preventDefault()

  # [OPTIMIZE] Set the main image to be the same as the thumbnail
  #   There's probably a better way to do this, but I'm not sure.
  #   Perhaps use HTML5 data attribs.
  $('#product_main_photo img').attr 'src', $(this).attr('src')
  $('#product_main_photo a').attr 'href', $(this).parent().attr('href')


$("#photos").mCustomScrollbar(horizontalScroll: true)

max = 0
$("#photos img").each ->
  max = Math.max(max, $(this).outerHeight())

$('#photos, #photos-inner').css('height', max+20)

# Make the photos sortable if the user is an admin
# admin ->
#   $('#photos').sortable
#     axis: 'x'
#     cursor: 'move'
#     opacity: .5
#     scroll: true
#     update: (e, ui) ->
#       sort_photos(e, ui)

#   sort_photos = (e, ui) ->
#     item_id = $('#photos').data('id')
#     $.put(
#       "/items/#{item_id}/photos/sort", 
#       $('#photos').sortable('serialize', key: 'photos[]')
#     )
