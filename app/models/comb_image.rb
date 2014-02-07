class CombImage < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  attr_accessible :comb_id, :photo, :display_order
  belongs_to :comb
  validates :photo, :display_order, presence: true
end
