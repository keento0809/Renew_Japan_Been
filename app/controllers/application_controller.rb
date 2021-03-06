class ApplicationController < ActionController::Base
    include SessionsHelper
    
    # before_action :logged_in_user
    before_action :set_search, :get_prefectures, 
                    :set_all_memories, only: :index


    def already_logged_in?
        if logged_in?
            flash[:alert] = "You've already logged in"
            redirect_to root_url
        end
    end
    
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
