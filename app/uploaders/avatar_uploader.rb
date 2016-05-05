# encoding: utf-8

class AvatarUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  permissions 0777
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def default_url
    "avatars/default.png"
  end

  process resize_to_fill: [450, 450]

  version :mini do
     process resize_to_fill: [150, 150]
  end

  def extension_white_list
     %w(jpg jpeg gif png)
  end

end
