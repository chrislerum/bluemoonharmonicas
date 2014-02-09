ActiveAdmin.register Comb do
  menu parent: "Products"

  config.sort_order = "name_asc"

  action_item only:[:show] do
    link_to "New", new_admin_comb_path
  end

  index do
    column :name, sortable: :name do |comb|
      link_to comb.name, admin_comb_path(comb)
    end
    column "Brand" do |comb|
      comb.brand && comb.brand.name
    end
    column "Model" do |comb|
      comb.model && comb.model.name
    end
    column "Material Type" do |comb|
      comb.material_type && comb.material_type.name
    end
    column "Color" do |comb|
      comb.color && comb.color.name
    end
    column "Images" do |comb|
      comb.comb_images.count.to_s
    end
    column "Price" do |comb|
      humanized_money_with_symbol comb.price
    end
    column :quantity
    default_actions
  end

  form html: {multipart: true} do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Comb Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :brand
      f.input :model
      f.input :material_type
      f.input :color
      f.has_many :comb_images do |i|
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
      row :price do |comb|
        humanized_money_with_symbol comb.price
      end
      row :quantity
      row :brand do |comb|
        comb.brand.name
      end
      row :model do |comb|
        comb.model.name
      end
      row :material_type do |comb|
        comb.material_type.name
      end
      row :color do |comb|
        comb.color.name
      end
      panel "Images" do
        table_for comb.comb_images.order(:display_order) do
          column do |image|
            image_tag image.photo.thumb
          end
          column :display_order
        end
      end
    end
  end

  action_item :only => :show do
    link_to "New based on this", special_new_admin_comb_path(comb)
  end

  member_action :special_new do
    x = Comb.find(params[:id])
    y = Comb.new

    y.name = "#{x.name} copy #{rand(10000000000) + 10000}"
    y.description = x.description
    y.brand = x.brand
    y.model = x.model
    y.material_type = x.material_type
    y.color = x.color
    y.price_cents = x.price_cents
    y.quantity = 0

    y.save!
    redirect_to edit_admin_comb_path y
  end
end








