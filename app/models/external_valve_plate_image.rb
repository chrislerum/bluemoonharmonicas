class ExternalValvePlateImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :external_valve_plate_id, :photo, :display_order
  belongs_to :external_valve_plate
  validates :photo, :display_order, presence: true
end
