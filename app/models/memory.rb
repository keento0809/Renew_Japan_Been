class Memory < ApplicationRecord
    belongs_to :user
    belongs_to :prefecture

    # scope :custom_display, -> { order(:created_at).last(10) }
    # Ex:- scope :active, -> {where(:active => true)}

    mount_uploader :img, ImgUploader
end
