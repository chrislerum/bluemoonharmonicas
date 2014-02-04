ActiveAdmin.register CustomHtml do
  menu parent: "Miscellaneous"
  show do
    attributes_table do
      row :content do |custom_html|
        custom_html.content.html_safe
      end
      row :display_order
    end
  end
end
