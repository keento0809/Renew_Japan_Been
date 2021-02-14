class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
        # log_in：渡されたユーザーでログインする(ブラウザのcookieにハッシュ化されたuser_idを保存するメソッド)
        flash[:success] = 'Success to login!'
        log_in user
        # remember_meにチェックが入っていれば記憶トークン等を登録、チェックが無ければ記憶トークンを削除
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_url
    else
        flash.now[:danger] = 'Failed!'
        # railsではコントローラ名とメソッド名からrenderメソッドを記載しなくても自動的にレンダリングするビューを特定してくれる
        render 'homes/index'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Success to logout!"
    redirect_to root_url
  end
  
end
