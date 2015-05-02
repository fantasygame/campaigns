class HeroUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  process resize_to_fit: [600, 800]

  def store_dir
    "#{Rails.root}/tmp/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}/"
  end

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "hero.#{model.image.file.extension}" if original_filename
  end
end
