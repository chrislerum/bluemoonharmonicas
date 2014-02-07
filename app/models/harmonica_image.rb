class HarmonicaImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :harmonica_id, :photo, :display_order
  belongs_to :harmonica
  validates :photo, :display_order, presence: true
end
