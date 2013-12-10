# This is a little helper method for checking if a certain CSS3 attribute
# is supported

window.supports = ->
  div = document.createElement 'div'
  vendors = 'Khtml Ms O Moz Webkit'.split ' '
  len = vendors.length

  (prop) ->
    return true if prop in div.style

    prop = prop.replace /^[a-z]/, (val) ->
      val.toUpperCase

    while len--
      if vendors[len] + prop in div.style
        return true

    false

