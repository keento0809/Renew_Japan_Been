class ApplicationController < ActionController::Base
    include SessionsHelper
    # include PrefecturesHelper

    # before_action :logged_in_user
    before_action :set_search, :get_prefectures, 
                    :set_all_memories, only: :index

    # before_save :check_presence
    # before_save :check_presence

    
    def set_search
        @search = Prefecture.ransack(params[:q])
        @search_Prefectures = @search.result
    end

    def get_prefectures
        @prefectures = Prefecture.all
        @prefectures = @prefectures.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    end

    def index
        @prefectures = Prefecture.all
        @prefectures = @prefectures.where('name LIKE ?', "%#{params[:search]}%") if params[:search].present?
    end

    def set_all_memories
        @memories = Memory.all
    end

    # ログイン中のユーザーのCheckデータが存在しているか否か
    def set_user_check
        @user = User.find_by(id: current_user.id)
        @user.checks.exists?
        # @check = Check.find_by(user_id: self.user.id)
    end

    def check_presence
        if set_check
            render 'checks/index', notice: 'You have already had your check.'
        end
    end


    # def current_user
    #     if (user_id = session[:user_id])
    #         @current_user ||= User.find_by(id: user_id)
    #     elsif (user_id = cookies.signed[:user_id])
    #         user = User.ind_by(id: user_id)
    #         if user && user.authenticated?(cookies[:remember_token])
    #             # ユーザーIDと記憶ダイジェストを使ってユーザーを取得した後にはlog_inメソッドでセッションも開始している
    #             log_in user
    #             @current_user = user
    #         end
    #     end
    # end

    # ログインしていないユーザーをログインページにリダイレクトするアクションを作成する
    # application_controllerに追加することで、全てのコントローラで利用できるようになる
    private

        # ログイン済みユーザーかどうか確認
        def logged_in_user
            # logged_in?：ユーザーがログインしていればtrue、その他ならfalseを返す
            unless logged_in?
                flash[:danger] = "Please log in."
                # render 'home/index'
                redirect_to root_url
            end
        end

end
