class PowderCoatedCover < ActiveRecord::Base
  monetize :price_cents
  attr_accessible :price, :quantity, :brand_id, :color_id, :description, :model_id, :name, :powder_coated_cover_images_attributes
  belongs_to :brand
  belongs_to :model
  belongs_to :color
  has_many :powder_coated_cover_images
  has_many :line_items, as: :purchasable
  accepts_nested_attributes_for :powder_coated_cover_images, allow_destroy: true
  validates :price, :quantity, :name, :description, :brand_id, :model_id, :color_id, presence: true
  validates :price, :quantity, numericality: true
  validates :name, uniqueness: true

  def self.search(query)
    if query.present?
      rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(description), plainto_tsquery(#{sanitize(query)}))
      RANK
      where("name @@ :q or description @@ :q", q: query).order("#{rank} desc")
    else
      scoped
    end
  end
end
