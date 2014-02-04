ActiveAdmin.register Color do
  menu parent: "Product Attributes"

  index do
    column :name, sortable: :name do |color|
      link_to color.name, admin_color_path(color)
    end
    column "Combs" do |color|
      color.combs.count.to_s
    end
    column "Powder Coated Covers" do |color|
      color.powder_coated_covers.count.to_s
    end
    default_actions
  end
end

