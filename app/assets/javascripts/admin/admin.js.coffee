$ ->
  full_height = ->
    $('.panel').height $(window).height()

  $(window).on 'resize', full_height
  full_height()

  $('.button_to').live 'submit', ->
    confirm('Are you sure you want to delete this category?')


