class Comb < ActiveRecord::Base

  monetize :price_cents
  attr_accessible :brand_id, :color_id, :description, :material_type_id, :model_id, :name, :price, :quantity, :comb_images_attributes
  belongs_to :brand
  belongs_to :model
  belongs_to :material_type
  belongs_to :color
  has_many :comb_images
  has_many :line_items, as: :purchasable
  accepts_nested_attributes_for :comb_images, allow_destroy: true
  validates :price_cents, :quantity, :name, :description, :brand_id, :model_id, :material_type_id, :color_id, presence: true
  validates :price_cents, :quantity, numericality: true
end
