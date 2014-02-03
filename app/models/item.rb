#class Item < ActiveRecord::Base

  #attr_accessible :key_id, :color_id, :item_images_attributes, :model_id, :description, :name, :price, :shortname, :quantity

  #has_many :item_images
  #has_many :line_items
  #belongs_to :model
  #belongs_to :color
  #belongs_to :key
  #accepts_nested_attributes_for :item_images, allow_destroy: true

  #validates :key, :color, :name, :model, :description, presence: true
  #validates :quantity, :price, presence: true, numericality: true

  #def self.search(query)
    #if query.present?
      #rank = <<-RANK
        #ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)})) +
        #ts_rank(to_tsvector(shortname), plainto_tsquery(#{sanitize(query)})) +
        #ts_rank(to_tsvector(description), plainto_tsquery(#{sanitize(query)}))
      #RANK
      #where("name @@ :q or shortname @@ :q or description @@ :q", q: query).order("#{rank} desc")
    #else
      #scoped
    #end
  #end
#end
