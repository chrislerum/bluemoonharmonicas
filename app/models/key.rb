class Key < ActiveRecord::Base
  attr_accessible :name
  has_many :harmonicas
  validates :name, presence: true, uniqueness: true
  default_scope order 'name ASC'
end
