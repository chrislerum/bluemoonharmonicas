ActiveAdmin.register Color do
  config.sort_order = "name_asc"
  menu parent: "Product Attributes"

  action_item only:[:show] do
    link_to "New Color", new_admin_color_path
  end

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

  form do |f|
    f.inputs "Color Details" do
      f.input :name
    end
  end

  show do
    attributes_table do
      row :name
    end
  end
end

