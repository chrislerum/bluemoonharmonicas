ActiveAdmin.register HarpModel do

  index do
    column :name, sortable: :name do |harp_model|
      link_to harp_model.name, admin_harp_model_path(harp_model)
    end
    column :brand
    column "Items" do |harp_model|
      harp_model.items.count.to_s
    end
    default_actions
  end

  show do
    attributes_table do
      row :name
      row "Items" do |harp_model|
        harp_model.items.count.to_s
      end
    end
  end
end
