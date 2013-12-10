module Admin::InventoryHelper
  def form_table(options)
    out = "<table>"
    options.each do |option|
      out += "<tr>"
      option.each do |variant|
        out += "<td>"
          out += text_field_tag("variant_#{variant.id}", nil, style: "width: 20px") unless variant.nil?
        out += "</td>"
      end
      out += "</tr>"
    end
    out += "</table>"
    out.html_safe
  end
end
