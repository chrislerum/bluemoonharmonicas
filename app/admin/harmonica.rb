ActiveAdmin.register Harmonica do

  config.sort_order = "name_asc"

  action_item only:[:show] do
    link_to "New", new_admin_harmonica_path
  end

  index do
    column :name, sortable: :name do |harmonica|
      link_to harmonica.name, admin_harmonica_path(harmonica)
    end
    column "Brand" do |harmonica|
      harmonica.brand.name
    end
    column "Model" do |harmonica|
      harmonica.model.name
    end
    column "Key" do |harmonica|
      harmonica.key.name
    end
    column "Images" do |harmonica|
      harmonica.harmonica_images.count.to_s
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
      row :price do |item|
        number_to_currency(item.price)
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

end
