ActiveAdmin.register Item do

  index do
    column :name do |item|
      link_to item.name, admin_item_path(item)
    end
    column :price
    column :quantity
    default_actions
  end

  form html: {multipart: true} do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Item Details" do
      f.input :harp_model
      f.input :name
      f.input :description
      f.input :price
      f.has_many :item_images do |i|
        i.input :photo, :as => :file, :label => "Image", hint: image_tag(i.object.photo.thumb.url)
        i.input :_destroy, as: :boolean, label: 'Remove'
      end
    end
    f.actions
  end

  show do |x|
    attributes_table do
      row :id
      row :name
      panel "Items" do
        table_for item.item_images do
          column do |item_image|
            image_tag item_image.photo, width: 200, height: 200
          end
        end
      end
    end
  end
end
