ActiveAdmin.register Key do
  config.sort_order = "name_asc"
  menu parent: "Product Attributes"

  index do
    column :name, sortable: :name do |key|
      link_to key.name, admin_key_path(key)
    end
    column "Harmonicas" do |key|
      key.harmonicas.count.to_s
    end
    default_actions
  end
end
