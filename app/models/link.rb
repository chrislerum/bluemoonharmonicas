class Link < ActiveRecord::Base
  attr_accessible :description, :link, :title, :position

  validates_presence_of :title, :link, :description

  validates_format_of :link, :with => URI::regexp(%w(http https))
end
