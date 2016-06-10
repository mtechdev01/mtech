# encoding: utf-8

class ThumbUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  permissions 0777
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    [version_name, "default.jpg"].compact.join('_')
  end

  process resize_to_fill: [1024, 720]

  version :thumbnail do
     process resize_to_fill: [250, 175]
  end

  version :icon do
     process resize_to_fill: [120, 120]
  end

  version :image do
     process resize_to_fill: [250, 175]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

end
