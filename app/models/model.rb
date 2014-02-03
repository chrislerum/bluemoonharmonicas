class Model < ActiveRecord::Base
  attr_accessible :brand, :name
  has_many :combs
  validates :name, presence: true
end
