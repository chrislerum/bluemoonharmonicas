class Option < ActiveRecord::Base
  attr_accessible :title, :sentence

  validates :title, presence: true
  validates :sentence, presence: true

  has_and_belongs_to_many :items, after_add: :tell_item_to_create_variants
  has_many :values, class_name: 'OptionValue', dependent: :destroy,
            after_add: :tell_all_items_to_create_variants, order: 'id ASC'

  def self.to_table 
    Option.all.map do |option|
      option.values.map do |option_value|
        option_value.variants.sort { |a,b| a.item_id <=> b.item_id }
      end
    end[0]
  end

  def tell_item_to_create_variants(item)
    item.create_variants(self)
  end

  def tell_all_items_to_create_variants(value)
    self.items.each { |item| item.create_variants(self) }
  end
end
