# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

dropdown_menu = (button, menu) ->
  $(button).click (e) ->
    e.preventDefault()

  $(button).bind 'mouseenter', ->
    button.addClass 'dropdown_present'
    left = button.offset().left
    $(menu).css('left', left+'px').clearQueue().fadeIn(100)

  $(button).bind 'mouseleave', ->
    button.removeClass 'dropdown_present'
    $(menu).delay(10).fadeOut(100)

  $(menu).bind 'mouseenter', ->
    button.addClass 'dropdown_present'
    $(this).clearQueue()

  $(menu).bind 'mouseleave', ->
    button.removeClass 'dropdown_present'
    $(this).delay(10).fadeOut(100)

jQuery ->
  dropdown_menu $('#products_link'), $('#products_dropdown')
