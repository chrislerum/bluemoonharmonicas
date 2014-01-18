class ItemImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :item_id, :photo, :display_order
  belongs_to :item
  validates :item_id, :photo, :display_order, presence: true
end
