class Item < ActiveRecord::Base

  attr_accessible :item_images_attributes, :harp_model_id, :description, :name, :price, :shortname, :quantity

  has_many :item_images
  has_many :line_items
  belongs_to :harp_model
  accepts_nested_attributes_for :item_images, allow_destroy: true

  validates :name, :harp_model, :description, presence: true
  validates :quantity, :price, presence: true, numericality: true

  def self.search(query)
    if query.present?
      rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(shortname), plainto_tsquery(#{sanitize(query)})) +
        ts_rank(to_tsvector(description), plainto_tsquery(#{sanitize(query)}))
      RANK
      where("name @@ :q or shortname @@ :q or description @@ :q", q: query).order("#{rank} desc")
    else
      scoped
    end
  end
end
