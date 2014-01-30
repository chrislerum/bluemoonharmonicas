ActiveAdmin.register Item do
  config.sort_order = "name_asc"

  action_item only:[:show] do
    link_to "New", new_admin_item_path
  end

  index do
    column :name, sortable: :name do |item|
      link_to item.name, admin_item_path(item)
    end
    column "Color" do |item|
      item.color && item.color.name
    end
    column "Key" do |item|
      item.key && item.key.name
    end
    column "Images" do |item|
      item.item_images.count.to_s
    end
    column :quantity
    default_actions
  end

  form html: {multipart: true} do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Item Details" do
      f.input :harp_model
      f.input :color
      f.input :key
      f.input :name
      f.input :quantity
      f.input :description
      f.input :price
      f.has_many :item_images do |i|
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
      row :color do |item|
        item.color && item.color.name
      end
      row :key do |item|
        item.key && item.key.name
      end
      row :quantity
      row :description
      row :price do |item|
        number_to_currency(item.price)
      end
      panel "Images" do
        table_for item.item_images.order(:display_order) do
          column do |item_image|
            image_tag item_image.photo.thumb
          end
          column :display_order
        end
      end
    end
  end
end
