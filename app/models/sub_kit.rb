class SubKit < ActiveRecord::Base

  monetize :price_cents
  attr_accessible :description, :model_id, :name, :price, :quantity, :sub_kit_images_attributes
  belongs_to :model
  has_many :sub_kit_images
  has_many :line_items, as: :purchasable
  validates :price_cents, :quantity, :name, :description, :model_id, presence: true
  validates :price_cents, :quantity, numericality: true
  validates :name, uniqueness: true
  accepts_nested_attributes_for :sub_kit_images, allow_destroy: true

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
