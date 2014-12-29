ActiveAdmin.register SubCustomizationKit do
  menu parent: "Products"

  config.sort_order = "name_asc"

  action_item only:[:show] do
    link_to "New", new_admin_sub_customization_kit_path
  end

  index do
    column :name, sortable: :name do |sub_customization_kit|
      link_to sub_customization_kit.name, admin_sub_customization_kit_path(sub_customization_kit)
    end
    column "Model" do |sub_customization_kit|
      sub_customization_kit.model && sub_customization_kit.model.name
    end
    column "Price" do |sub_customization_kit|
      humanized_money_with_symbol sub_customization_kit.price
    end
    column :quantity
    default_actions
  end

  form html do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Sub 30 Customization Kit Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :model
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price do |sub_customization_kit|
        humanized_money_with_symbol sub_customization_kit.price
      end
      row :quantity
      row :model do |sub_customization_kit|
        sub_customization_kit.model.name
      end
    end
  end

  action_item :only => :show do
    link_to "New based on this", special_new_admin_sub_customization_kit_path(sub_customization_kit)
  end

  member_action :special_new do
    x = sub_customization_kit.find(params[:id])
    y = sub_customization_kit.new

    y.name = "#{x.name} copy #{rand(10000000000) + 10000}"
    y.description = x.description
    y.model = x.model
    y.price_cents = x.price_cents
    y.quantity = 0

    y.save!
    redirect_to edit_admin_sub_customization_kit_path y
  end
end
