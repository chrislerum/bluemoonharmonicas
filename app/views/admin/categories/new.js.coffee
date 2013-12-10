new_button = $('#category-view a.new')

coords = new_button.offset()
coords =
  top: coords.top + new_button.outerHeight()-10
  left: coords.left + new_button.outerWidth()/2 - 48

$('body').append("<%= j render("form", category: @category) %>")
console.log(coords)
$('#new-photo').css(coords).fadeIn(100)
$('#new-photo input[type=hidden]').val($('#detail-view').attr('data-item-id'))

$('#new-photo input').select()
$('#new-photo input').on 'blur', ->
  $('#new-photo').fadeOut 100, ->
    $('#new-photo').remove()
