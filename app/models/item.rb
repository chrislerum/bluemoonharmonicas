class Item < ActiveRecord::Base

  attr_accessible :item_images_attributes, :harp_model_id, :unique, :description, :name, :price, :shortname, :option_ids, :manages_inventory, :quantity, :upgradable, :upgrade_price, :variants_attributes

  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true

  has_and_belongs_to_many :options, after_add: :create_variants
  belongs_to :harp_model
  has_many :line_items, as: :purchasable
  has_many :variants
  accepts_nested_attributes_for :variants

  validates :name, presence: true
  validates :harp_model, :description, presence: true
  validates :price, presence: true, numericality: true

  #def unique?
    #if !quantity.nil?
      #true
    #else
      #false
    #end
  #end

  #def cover_plate_upgrades
    #parallel_items.select { |i| i.category_ids.include?(9) }.map(&:variants).flatten.sort do |a, b|
      #a.option_value.title <=> b.option_value.title
    #end
  #end

  #def comb_upgrades
    #combs = Category.find_by_name('Combs')

    ## => {#<category> => [arr_of_variants], #<category> => [arr_of_variants]}
    #Hash[combs.children.map do |comb_type|
      #[comb_type, parallel_items.select { |i| i.category_ids.include?(comb_type.id) }.map(&:variants).flatten]
    #end]
  #end

  # Finds items belonging to the same model
  #def parallel_items
    #harp_model_id.present? ? Item.where(harp_model_id: harp_model_id) : Item.where(id: -1)
  #end

  #def load_photos(string)
    #new_photos = string.split("\n").map! do |line|
      #{src: line.split(' ')[0], href: line.split(' ')[1]}
    #end

    #new_photos.each { |p| photos.create(p) }
  #end

  #def quantity=(quantity)
    #unless quantity.blank?
      #write_attribute(:quantity, quantity)
    #end
  #end

  #def create_variants(option)
    #option.values.each do |value|
      #variant = Variant.where(item_id: self.id, option_value_id: value.id).first || Variant.new
      #if variant.new_record?
        #variant.item = self
        #variant.option_value = value
        #variant.quantity = 0
        #variant.save
      #end
    #end
  #end

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

end
