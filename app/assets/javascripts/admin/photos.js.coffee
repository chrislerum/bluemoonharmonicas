$ ->
  $('#photos ul').sortable
    items: "li:not(.new)"
    axis: "x"
    update: ->
      $.post($(this).attr('data-update-path'), $(this).sortable('serialize'))
