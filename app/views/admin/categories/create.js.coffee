$("<%= j render @category %>").appendTo('#category-view>ul').hide().show(100)
$("#new-photo").hide 'fast', ->
  $(this).remove()
