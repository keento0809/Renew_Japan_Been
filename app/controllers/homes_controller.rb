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
    if logged_in?
      @check = Check.find_by(user_id: current_user.id)
      @label = Label.where(check_id: current_user.id)
      gon.check = @check
      gon.label = @label
    end
  end

  def set_search
    @search = Prefecture.ransack(params[:q])
    @search_Prefectures = @search.result
  end
end
