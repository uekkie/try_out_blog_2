class PostUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ['post_image']

  version :thumbnail do
    process :resize_to_fit => [300, nil]
  end

  def public_id
    return model.id
  end
end
