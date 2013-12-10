$ ->
  # Dynamically submit form when it's changed
  $('form.edit_item, form.edit_option').change ->
    $(this).submit()
