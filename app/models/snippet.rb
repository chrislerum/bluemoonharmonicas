class Snippet < ActiveRecord::Base
  attr_accessible :shortcut, :text

  validates :shortcut, presence: true, uniqueness: true

  validates_presence_of :text
end
