module SessionsHelper

    # log_in：渡されたユーザーでログインする(ブラウザのcookieにハッシュ化されたuser_idを保存するメソッド)
    def log_in(user)
        session[:user_id] = user.id
    end

    # 現在ログイン中のユーザーを返す(いる場合)
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
            if user && user.authenticated?(cookies[:remember_token])
                # ユーザーIDと記憶ダイジェストを使ってユーザーを取得した後にはlog_inメソッドでセッションも開始している
                log_in user
                @current_user = user
            end
        end
    end

    # マイページなど、ログイン中のユーザーにしか表示させたくないページのbefore_actionでよく使われる
    # 受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
    def current_user?(user)
        user == current_user
    end

    # 現在のユーザーがログインしているかどうかを判別するメソッド。ログイン状況に応じて表示する画面を切り替えたりする処理が簡単に実装できるうようになる
    # ユーザーがログインしていればtrue、その他ならfalseを返す
    def logged_in?
        # nil?：Rubyの標準メソッド。nilの場合のみtrueで返し、それ以外はfalseを返す
        !current_user.nil?
    end

    # 現在のユーザーをログアウトする
    def log_out
        # 作成したヘルパーメソッドforgetを、ログアウト用ヘルパーメソッドlog_outから呼び出す
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    def remember(user)
        user.remember # Userモデルで定義したrememberメソッド。(記憶トークンを作成、ハッシュ化してDBに保存)
        cookies.permanent.signed[:user_id] = user.id # ユーザーIDを暗号化してcookieに保存
        cookies.permanent[:remember_token] = user.remember_token # 記憶トークンをcookieに保存
    end

    # 永続的セッションを破棄する
    def forget(user)
        user.forget # Userクラスでのforgetメソッド。DBの記憶ダイジェストにnilを登録
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
end
