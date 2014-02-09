ActiveAdmin.register PowderCoatedCover do
  menu parent: "Products"

  config.sort_order = "name_asc"

  action_item only:[:show] do
    link_to "New", new_admin_powder_coated_cover_path
  end

  index do
    column :name, sortable: :name do |powder_coated_cover|
      link_to powder_coated_cover.name, admin_powder_coated_cover_path(powder_coated_cover)
    end
    column "Brand" do |powder_coated_cover|
      powder_coated_cover.brand && powder_coated_cover.brand.name
    end
    column "Model" do |powder_coated_cover|
      powder_coated_cover.model && powder_coated_cover.model.name
    end
    column "Color" do |powder_coated_cover|
      powder_coated_cover.color && powder_coated_cover.color.name
    end
    column "Images" do |powder_coated_cover|
      powder_coated_cover.powder_coated_cover_images.count.to_s
    end
    column "Price" do |powder_coated_cover|
      humanized_money_with_symbol powder_coated_cover.price
    end
    column :quantity
    default_actions
  end

  form html: {multipart: true} do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Powder Coated Cover Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :brand
      f.input :model
      f.input :color
      f.has_many :powder_coated_cover_images do |i|
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
      row :price do |powder_coated_cover|
        humanized_money_with_symbol powder_coated_cover.price
      end
      row :quantity
      row :brand do |powder_coated_cover|
        powder_coated_cover.brand.name
      end
      row :model do |powder_coated_cover|
        powder_coated_cover.model.name
      end
      row :color do |powder_coated_cover|
        powder_coated_cover.color.name
      end
      panel "Images" do
        table_for powder_coated_cover.powder_coated_cover_images.order(:display_order) do
          column do |image|
            image_tag image.photo.thumb
          end
          column :display_order
        end
      end
    end
  end

  action_item :only => :show do
    link_to "New based on this", special_new_admin_powder_coated_cover_path(powder_coated_cover)
  end

  member_action :special_new do
    x = PowderCoatedCover.find(params[:id])
    y = PowderCoatedCover.new

    y.name = "#{x.name} copy #{rand(10000000000) + 10000}"
    y.description = x.description
    y.brand = x.brand
    y.model = x.model
    y.color = x.color
    y.price_cents = x.price_cents
    y.quantity = 0

    y.save!
    redirect_to edit_admin_powder_coated_cover_path y
  end
end
