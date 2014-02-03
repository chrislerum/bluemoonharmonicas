class Harmonica < ActiveRecord::Base
  attr_accessible :brand_id, :description, :key_id, :model_id, :name, :price, :quantity, :harmonica_images_attributes
  belongs_to :brand
  belongs_to :model
  belongs_to :key
  has_many :harmonica_images
  accepts_nested_attributes_for :harmonica_images, allow_destroy: true
  validates :price, :quantity, :name, :description, :brand_id, :model_id, :key_id, presence: true
  validates :price, :quantity, numericality: true
end
