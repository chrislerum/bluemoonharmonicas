class PowderCoatedCover < ActiveRecord::Base
  attr_accessible :price, :quantity, :brand_id, :color_id, :description, :model_id, :name, :powder_coated_cover_images_attributes
  belongs_to :brand
  belongs_to :model
  belongs_to :color
  has_many :powder_coated_cover_images
  accepts_nested_attributes_for :powder_coated_cover_images, allow_destroy: true
  validates :price, :quantity, :name, :description, :brand_id, :model_id, :color_id, presence: true
  validates :price, :quantity, numericality: true
end
