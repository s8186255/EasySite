# encoding: utf-8

class Attachment::ImageUploader < Attachment::AssetUploader

  #include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  def extension_white_list
    EXT_NAMES[:image]
  end
  def store_dir
    "uploads/images"
  end

  version :thumb do
    process :resize_to_fit => [50,100]
  end

end

