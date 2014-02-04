ActiveAdmin.register MaterialType do
  menu parent: "Product Attributes"

  index do
    column :name, sortable: :name do |material_type|
      link_to material_type.name, admin_material_type_path(material_type)
    end
    column "Combs" do |material_type|
      material_type.combs.count.to_s
    end
    default_actions
  end
end
