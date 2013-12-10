$("<%= j render @photo, item: @item %>").insertAfter('#photos .new').hide().show(100)
$('#new-photo').fadeOut 100, ->
  $('#new-photo').remove()
