class OptionValue < ActiveRecord::Base
  belongs_to :option
  attr_accessible :price_diff, :title
  has_many :variants, dependent: :destroy
end
