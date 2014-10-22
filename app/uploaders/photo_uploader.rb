# encoding: utf-8
class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  process :resize_to_fit => [450, 450]
  version :thumb do
    process :resize_to_fit => [150, 150]
  end
end
