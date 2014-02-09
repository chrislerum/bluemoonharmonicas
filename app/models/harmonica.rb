class Harmonica < ActiveRecord::Base
  monetize :price_cents
  attr_accessible :brand_id, :description, :key_id, :model_id, :name, :price, :quantity, :harmonica_images_attributes
  belongs_to :brand
  belongs_to :model
  belongs_to :key
  has_many :harmonica_images
  has_many :line_items, as: :purchasable
  accepts_nested_attributes_for :harmonica_images, allow_destroy: true
  validates :price, :quantity, :name, :description, :brand_id, :model_id, :key_id, presence: true
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
