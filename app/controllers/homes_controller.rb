class HomesController < ApplicationController
    before_action :set_search

  def index
    if params[:search].present?
        @prefectures = Prefecture.where('name LIKE(?)', "%#{params[:search]}%")
    else
        @prefectures = Prefecture.all
        # @prefectures = "bbb"
    end
  end

  def set_search
    @search = Prefecture.ransack(params[:q])
    @search_Prefectures = @search.result
  end
end
