admin ->
  $('#links').sortable
    axis: 'y'
    cursor: 'move'
    opacity: .5
    scroll: true
    update: (e, ui) ->
      sort_links(e, ui)

  sort_links = (e, ui) ->
    $.put(
      "/links/sort", 
      $('#links').sortable('serialize', key: 'links[]')
    )
