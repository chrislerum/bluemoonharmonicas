$('#category_<%= @category.id %>').hide 'fast', ->
  $(this).remove()
