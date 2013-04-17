require 'carrierwave/processing/mime_types'

class ApplicationUploader < CarrierWave::Uploader::Base

  include CarrierWave::MimeTypes

  process :set_content_type

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  #def default_url
    #asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
    #"/images/fallback/" + [version_name, "default.png"].compact.join('_')
  #end

end
