class Model < ActiveRecord::Base
  attr_accessible :name
  has_many :combs
  has_many :harmonicas
  has_many :powder_coated_covers
  has_many :sub_kits
  has_many :external_valve_plates
  validates :name, presence: true, uniqueness: true
  default_scope order 'name ASC'
end
