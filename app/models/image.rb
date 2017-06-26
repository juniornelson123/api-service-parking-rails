class Image < ApplicationRecord
	 belongs_to :imageable, polymorphic: true, optional: true

	 mount_base64_uploader :image, ImageUploader

end
