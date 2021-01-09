class LikesController < ApplicationController
    before_action :set_prefecture

    def create
        @like = Like.create(user_id: current_user.id, prefecture_id: @prefecture.id)
    end

    def destroy
        @like = current_user.likes.find_by(prefecture_id: @prefecture.id)
        @like.destroy
    end


    
    # def index
    #     @like_prefectures = current_user.like_prefectures
    # end

    # def create
    #     # Likeクラスのインスタンスを作成
    #     @like = Like.new
    #     # current_userのidを変数に代入
    #     @like.user_id = current_user.id
    #     @like.prefecture_id = params[:prefecture_id]

    #     # likeが保存できているか否かで条件分岐
    #     if like.save
    #         flash[:success] = 'Like successed!'
    #         redirect_to prefectures_path
    #     else
    #         redirect_to prefectures_path
    #     end
    # end

    # def destroy
    #     @like = Like.find_by(user_id: current_user.id, prefecture_id: params[:prefecture_id])
    #     @like.destroy
    #     flash[:success] = 'Like deleted!'
    #     redirect_to prefectures_path
    # end

    private
        def set_prefecture
            @prefecture = Prefecture.find(params[:prefecture_id])
        end
end
