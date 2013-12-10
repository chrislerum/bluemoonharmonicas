class Photo < ActiveRecord::Base
  belongs_to :photographable, polymorphic: true
  attr_accessible :caption, :href, :src, :position, :item_id

  validates_presence_of :href, :src

  default_scope order('position')

  def href=(url)
    pb = Photo.attrs_from_photobucket(url)
    write_attribute(:href, pb[:href])
    write_attribute(:src,  pb[:src])
  end

  def self.attrs_from_photobucket(url)
    core = url.match(/.+\/(.+).html/)[1]
    {
      href: url,
      src: "http://i1089.photobucket.com/albums/i354/bluemoonharmonicas/Blue%20Moon%20Picture%20Library/#{core}"
    }
  end
end
