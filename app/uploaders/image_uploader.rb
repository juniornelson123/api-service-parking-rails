class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :smallest do
    resize_to_fill(42,42)
  end

  version :thumb do
    resize_to_fill(80, 80)
  end

  version :thumb_tablet do
    resize_to_fill(62, 62)
  end

  version :thumb_whats do
    resize_to_fill(256, 256)
  end

  version :midi do
    resize_to_fill(276,276)
  end

  version :midi_mobile do
    resize_to_fill(194,194)
  end

  version :midi_tablet do
    resize_to_fill(232,232)
  end

  version :large do
    resize_to_fill(528,528)
    # process optimize: [{ quality: 90 }]
  end

  version :large_mobile do
    resize_to_fill(300,300)
    # process optimize: [{ quality: 90 }]
  end

  version :large_tablet do
    resize_to_fill(440,440)
    # process optimize: [{ quality: 90 }]
  end

end
