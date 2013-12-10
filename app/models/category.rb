class Category < ActiveRecord::Base
  acts_as_tree

  attr_accessible :name, :parent_id, :position

  default_scope -> { order('position asc') }

  has_and_belongs_to_many :items
end
