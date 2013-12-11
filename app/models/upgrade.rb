class Upgrade < ActiveRecord::Base
  belongs_to :variant
  belongs_to :line_item
  attr_accessible :line_item, :line_item_id, :variant, :variant_id, :upgrade_type
end
