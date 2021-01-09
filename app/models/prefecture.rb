class Prefecture < ApplicationRecord
    # belongs_to :user, optional: true
    belongs_to :check

    mount_uploader :img, ImgUploader
end
