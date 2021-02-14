class Prefecture < ApplicationRecord
    # prefectureは複数のmemoriesを所有する
    has_many :memories
    has_many :users, through: :memories, dependent: :destroy
    # has_many :users, through: :memories, dependent: :destory

    # Label, Check, Prefectureにてhas_many throughの関連付けを行う
    has_many :labels, dependent: :destroy
    has_many :checks, through: :labels

    mount_uploader :img, ImgUploader
end
