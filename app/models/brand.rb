class Brand < ActiveRecord::Base
  attr_accessible :name
  has_many :combs
  has_many :harmonicas
  has_many :powder_coated_covers
  validates :name, presence: true, uniqueness: true
  default_scope order 'name ASC'
end
