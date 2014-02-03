class PowderCoatedCoverImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :powder_coated_cover_id, :photo, :display_order
  belongs_to :powder_coated_cover
  validates :powder_coated_cover_id, :photo, :display_order, presence: true
end
