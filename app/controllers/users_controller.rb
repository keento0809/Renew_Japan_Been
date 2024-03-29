class UsersController < ApplicationController
    # before_actionはコントローラに記述する
    # before_action :user_params
    # loggged_in_user：ログイン済みユーザーか否かを確認
    before_action :logged_in_user, only: [:index, :edit, :update, :destory]
    # correct_user：正しいユーザーか確認
    before_action :correct_user, only: [:edit, :update]
    # ログイン済みの場合、サインアップ画面にアクセスできないようにする
    before_action :already_logged_in?, only: [:new]
    # 他ユーザーのマイページにアクセスできないようにする
    before_action :ensure_correct_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all.search(params[:search])
  end

  def show
    @user = User.find(params[:id])
    # @userと定義しないとエラーとなる。原因不明
    @memories = @user.memories.order('updated_at DESC')
    # @memories = Memories.where(user_id: current_user.id)
      @chart =[['a',10],['b',90]]
      
      if logged_in?
        @check = Check.find_by(user_id: current_user.id)
        # @label = Label.where(check_id: current_user.id)
        # @label修正後
        @label = @check.labels.where(params[:check_id])

      end
      
      def prefecture_ids_params
        # create時、.requireを入れるとどうしてもエラーになってしまう
          params.permit(:user_id, prefecture_ids: [])
      end
    
      def update_prefecture_ids_params
          # やはりupdate時は.requireを付けないと内容が更新されない
          params.require(:check).permit(:user_id, prefecture_ids: [])
      end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
        log_in(@user)
        flash[:success] = 'Success!'
        redirect_to root_path
    else
        flash[:danger] = 'Failed!'
        render :new
        # = render action: :new
        # 動いたアクションとは別のアクションのテンプレートを表示させる
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
        flash[:success] = "Profile updated!"
        redirect_to root_url
    else
        render 'edit'
    end
  end

#   def log_in(user)
#     session[:user_id] = user.id
#   end


  private

    # Userのストロングパラメーター
    # ストロングパラメーターはユーザー登録画面からPOSTされた情報のセキュリティのために実施。
    def user_params
        params.require(:user).permit(:name, :email, :password)
        # params.permit(:name, :email, :password_digest)
    end

    # ログイン中のユーザーと一致しているか確認
    def ensure_correct_user
      if current_user.id != params[:id].to_i
        flash[:alert] = "You cannot access this page."
        redirect_to root_url
      end
    end

    # 正しいユーザーかどうか確認
    def correct_user
        @user = User.find(params[:id])
        # unless：current_user?がfalseの時にredirect_to(root_url)が実行される
        # current_user?()：引数に受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
        redirect_to(root_url) unless current_user?(@user)
    end

    # 管理者かどうか確認
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end
