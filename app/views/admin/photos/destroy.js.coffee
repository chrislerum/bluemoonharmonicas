$("#photo_<%= @photo.id %>").hide 100, ->
  $(this).remove()
