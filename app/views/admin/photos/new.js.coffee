new_button = $('#photos li.new')
coords = new_button.offset()
coords =
  top: coords.top + new_button.outerHeight()-15
  left: coords.left + new_button.outerWidth()/2 - 50
$('body').append("<%= j render("form", item: @item, photo: @photo) %>")
console.log(coords)
$('#new-photo').css(coords).fadeIn(100)
$('#new-photo input[type=hidden]').val($('#detail-view').attr('data-item-id'))

$('#new-photo input').select()
$('#new-photo input').on 'blur', ->
  $('#new-photo').fadeOut 100, ->
    $('#new-photo').remove()
