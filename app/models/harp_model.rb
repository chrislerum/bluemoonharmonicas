class HarpModel < ActiveRecord::Base
  attr_accessible :brand, :name
  has_many :items
end
