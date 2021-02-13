class PrefecturesController < ApplicationController
    before_action :set_search

  def index
    if params[:search]
        @prefectures = Prefecture.where('name LIKE(?)',"%#{params[:search]}%")
    else
        @prefectures = Prefecture.all
    end
  end

  def new
    @prefecture = Prefecture.new
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    # @prefecture = Prefecture.find_by_name(prefecture.name).id
  end

  def edit

  end

  def update
    @prefecture = Prefecture.find(params[:id])
    # @prefecture.save(prefecture_params)
    if @prefecture.update(prefecture_params)
        redirect_to root_url, notice: 'Success!'
    else
        flash[:alert] = 'Update failed!'
        render 'show'
    end
  end


  def set_search
    @search = Prefecture.ransack(params[:q])
    @search_Prefectures = @search.result

    # 非同期通信テスト
    # unless params[:q].blank?
    #     render json: @prefectures.select("name").map { |e| e.name }.to_json
    # end
  end

  private
    def prefecture_params
        params.require(:prefecture).permit(:img, :comment)
    end
end
