class HomesController < ApplicationController
  before_action :logged_in_user, except: :index
  # include SessionsHelper
  # before_action :set_check, only: :index
  

  def index
    # if params[:search].present?
    #     @prefectures = Prefecture.where('name LIKE(?)', "%#{params[:search]}%")
    # else
    #     @prefectures = Prefecture.all
    #     # @prefectures = "bbb"
    # end
    #current_user.idはログインしているユーザーのid
    # @checkと@labelは紐づいてる。check>label>param paramは各パラメーターのことで今回はcheck_idを使用。他にもnameやemailも参照できる

    if logged_in?
      @check = Check.find_by(user_id: current_user.id)
      # @label = Label.where(check_id: current_user.id)
      # @label修正後

      @label = @check.labels.where(params[:check_id])
      gon.check = @check
      gon.label = @label
    end
  end

  def set_search
    @search = Prefecture.ransack(params[:q])
    @search_Prefectures = @search.result
  end
end
