ActiveAdmin.register ExternalValvePlate do
  menu parent: "Products", label: 'External Valve Plates'

  config.sort_order = "name_asc"

  action_item only:[:show] do
    link_to "New", new_admin_external_valve_plate_path
  end

  index do
    column :name, sortable: :name do |external_valve_plate|
      link_to external_valve_plate.name, admin_external_valve_plate_path(external_valve_plate)
    end
    column "Model" do |external_valve_plate|
      external_valve_plate.model && external_valve_plate.model.name
    end
    column "Images" do |external_valve_plate|
      external_valve_plate.external_valve_plate_images.count.to_s
    end
    column "Price" do |external_valve_plate|
      humanized_money_with_symbol external_valve_plate.price
    end
    column :quantity
    default_actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "External Valve Plates Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :model
      f.has_many :external_valve_plate_images do |i|
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
      row :price do |external_valve_plate|
        humanized_money_with_symbol external_valve_plate.price
      end
      row :quantity
      row :model do |external_valve_plate|
        external_valve_plate.model.name
      end
      panel "Images" do
        table_for external_valve_plate.external_valve_plate_images.order(:display_order) do
          column do |image|
            image_tag image.photo.thumb
          end
          column :display_order
        end
      end
    end
  end

  action_item :only => :show do
    link_to "New based on this", special_new_admin_external_valve_plate_path(external_valve_plate)
  end

  member_action :special_new do
    x = ExternalValvePlate.find(params[:id])
    y = ExternalValvePlate.new

    y.name = "#{x.name} copy #{rand(10000000000) + 10000}"
    y.description = x.description
    y.model = x.model
    y.price_cents = x.price_cents
    y.quantity = 0

    y.save!
    redirect_to edit_admin_external_valve_plate_path y
  end
end








