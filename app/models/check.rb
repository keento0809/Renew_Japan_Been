class Check < ApplicationRecord
    # Checkのデータはユーザーによって所有されている
    belongs_to :user

    # Label, Check, Prefectureにてhas_many throughの関連付けを行う
    has_many :labels, dependent: :destroy
    has_many :prefectures, through: :labels

    def Prefecture_name_slim
        self.Prefecture_name.gsub!(/[\[\]\"]/, "").gsub!(" ", "") if
        attribute_present?("prefecture_name")
    end
end
