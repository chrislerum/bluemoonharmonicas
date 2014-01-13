class ItemImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :item_id, :photo, :main_image
  belongs_to :item
end
