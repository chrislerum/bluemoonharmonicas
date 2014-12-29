ActiveAdmin.register SubKit do
  menu parent: "Products", label: 'SUB-30 Customization Kits'

  config.sort_order = "name_asc"

  action_item only:[:show] do
    link_to "New", new_admin_sub_kit_path
  end

  index do
    column :name, sortable: :name do |sub_kit|
      link_to sub_kit.name, admin_sub_kit_path(sub_kit)
    end
    column "Model" do |sub_kit|
      sub_kit.model && sub_kit.model.name
    end
    column "Images" do |sub_kit|
      sub_kit.sub_kit_images.count.to_s
    end
    column "Price" do |sub_kit|
      humanized_money_with_symbol sub_kit.price
    end
    column :quantity
    default_actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "SUB-30 Customization Kit Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :model
      f.has_many :sub_kit_images do |i|
        i.input :photo, :as => :file, :label => "Image", hint: image_tag(i.object.photo.thumb.url)
        i.input :display_order
        i.input :_destroy, as: :boolean, label: 'Remove'
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price do |sub_kit|
        humanized_money_with_symbol sub_kit.price
      end
      row :quantity
      row :model do |sub_kit|
        sub_kit.model.name
      end
      panel "Images" do
        table_for sub_kit.sub_kit_images.order(:display_order) do
          column do |image|
            image_tag image.photo.thumb
          end
          column :display_order
        end
      end
    end
  end

  action_item :only => :show do
    link_to "New based on this", special_new_admin_sub_kit_path(sub_kit)
  end

  member_action :special_new do
    x = SubKit.find(params[:id])
    y = SubKit.new

    y.name = "#{x.name} copy #{rand(10000000000) + 10000}"
    y.description = x.description
    y.model = x.model
    y.price_cents = x.price_cents
    y.quantity = 0

    y.save!
    redirect_to edit_admin_sub_kit_path y
  end
end








