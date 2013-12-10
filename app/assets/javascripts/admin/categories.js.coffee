$ ->  
  # Only show list roots  
  $('#category-view ul ul').hide().data('hidden', true);
  $('#category-view ul').data('hidden', true);

  # Show current link
  $('.current').parents('ul').show().data('hidden', false)

  # Set up click-to-collapse and expand
  $('#category-view ul li').click (e) ->
    # don't bubble up
    e.stopPropagation()

    if $(this).parent().data('hidden')
      $(this).find('>ul').slideDown(100)
      $(this).parent().data('hidden', false)
    else
      $(this).find('>ul').slideUp(100)
      $(this).parent().data('hidden', true)

  # Set up the list of categories to be sortable and nestable!
  $('#category-view > ul').nestedSortable(
    handle: '.drag-handle'
    listType: 'ul'
    items: 'li'
    placeholder: 'placeholder'
    forcePlaceholderSize: true
    toleranceElement: '> :first-child'
    update: ->
      $.post($(this).attr('data-update-path'), $(this).sortable('serialize'))
  ).disableSelection()
