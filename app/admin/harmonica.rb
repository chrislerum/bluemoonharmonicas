ActiveAdmin.register Harmonica do
  menu parent: "Products"

  config.sort_order = "name_asc"

  action_item only:[:show] do
    link_to "New", new_admin_harmonica_path
  end

  index do
    column :name, sortable: :name do |harmonica|
      link_to harmonica.name, admin_harmonica_path(harmonica)
    end
    column "Brand" do |harmonica|
      harmonica.brand && harmonica.brand.name
    end
    column "Model" do |harmonica|
      harmonica.model && harmonica.model.name
    end
    column "Key" do |harmonica|
      harmonica.key && harmonica.key.name
    end
    column "Images" do |harmonica|
      harmonica.harmonica_images.count.to_s
    end
    column "Price" do |harmonica|
      humanized_money_with_symbol harmonica.price
    end
    column :quantity
    default_actions
  end

  form html: {multipart: true} do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Harmonica Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :quantity
      f.input :brand
      f.input :model
      f.input :key
      f.has_many :harmonica_images do |i|
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
      row :price do |harmonica|
        humanized_money_with_symbol harmonica.price
      end
      row :quantity
      row :brand do |harmonica|
        harmonica.brand.name
      end
      row :model do |harmonica|
        harmonica.model.name
      end
      row :key do |harmonica|
        harmonica.key.name
      end
      panel "Images" do
        table_for harmonica.harmonica_images.order(:display_order) do
          column do |image|
            image_tag image.photo.thumb
          end
          column :display_order
        end
      end
    end
  end

  action_item :only => :show do
    link_to "New based on this", special_new_admin_harmonica_path(harmonica)
  end

  member_action :special_new do
    x = Harmonica.find(params[:id])
    y = Harmonica.new

    y.name = "#{x.name} copy #{rand(10000000000) + 10000}"
    y.description = x.description
    y.brand = x.brand
    y.model = x.model
    y.key = x.key
    y.price_cents = x.price_cents
    y.quantity = 0

    y.save!
    redirect_to edit_admin_harmonica_path y
  end
end
