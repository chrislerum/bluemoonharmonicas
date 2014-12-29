class SubKitImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :sub_kit_id, :photo, :display_order
  belongs_to :sub_kit
  validates :photo, :display_order, presence: true
end
