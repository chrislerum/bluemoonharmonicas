ActiveAdmin.register Brand do
  config.sort_order = "name_asc"
  menu parent: "Product Attributes"

  index do
    column :name, sortable: :name do |brand|
      link_to brand.name, admin_brand_path(brand)
    end
    column "Combs" do |brand|
      brand.combs.count.to_s
    end
    column "Harmonicas" do |brand|
      brand.harmonicas.count.to_s
    end
    column "Powder Coated Covers" do |brand|
      brand.powder_coated_covers.count.to_s
    end
    default_actions
  end
end
