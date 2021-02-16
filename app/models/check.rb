class Check < ApplicationRecord
    # Checkデータは1ユーザー1つのみに制限する（2回目以降はデータを更新する形）
    # MAX_CHECKS_COUNT = 1
    # Checkのデータはユーザーによって所有されている
    belongs_to :user

    # validate :checks_count_must_be_one

    # Label, Check, Prefectureにてhas_many throughの関連付けを行う
    has_many :labels, dependent: :destroy
    has_many :prefectures, through: :labels

    def Prefecture_name_slim
        self.Prefecture_name.gsub!(/[\[\]\"]/, "").gsub!(" ", "") if
        attribute_present?("prefecture_name")
    end

    private

    # def checks_count_must_be_one
        
    #     # errors.add(:base, "checks count limit: #{MAX_CHECKS_COUNT}") if user.checks.count >= MAX_CHECKS_COUNT
    # end
end
