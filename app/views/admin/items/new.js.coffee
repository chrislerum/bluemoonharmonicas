$('<%= j render("form", item: @item) %>').appendTo('body')
$('.new_item input:first-of-type').focus()
