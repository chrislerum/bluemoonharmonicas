class MaterialType < ActiveRecord::Base
  attr_accessible :name
  has_many :combs
  validates :name, presence: true, uniqueness: true
  default_scope order 'name ASC'
end
