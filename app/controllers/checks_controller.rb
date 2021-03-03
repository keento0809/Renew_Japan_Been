class ChecksController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user
  # before_action :check_string, only: [:create, :update]

def index
  @checks = Check.all
  @check = Check.find_by(user_id: current_user.id)
end

def new
  @check = Check.new
end

# test
def create
  # if !checks_count_must_be_one
    @check = Check.new(prefecture_ids_params)
    if @check.save!
      redirect_to root_url, notice: 'Create new check'
    else
      render 'homes/index', notice: 'Create check failed or you already have one.'
    end
  # end
end
# test ends here

def edit
  @check = Check.find_by(user_id:current_user.id)
end

def update
  @check = Check.find_by(user_id: current_user.id)
  if @check.update(update_prefecture_ids_params)
      flash[:success] = 'Success to update!'
      redirect_to root_url
  else
      render 'new'
  end
end

def destroy
  @check = Check.find(params[:id])
  @check.destroy
  redirect_to root_url, notice: 'Check deleted.'
end

private
  def set_order
      @check = Check.find(params[:id])
  end

  # def prefecture_name_params
  #     # params.permit(:user_id, prefecture_name: [])
  #     params.permit(:user_id, prefecture_name: [])
  # end

  def check_string
      # params[:check][:prefecture_name] = params[:check][:prefecture_name].join("/") # to string
      params[:prefecture_name] = params[:prefecture_name].join("/") # to string
  end

  # test
  def prefecture_ids_params
      # create時、.requireを入れるとどうしてもエラーになってしまう
      params.permit(:user_id, prefecture_ids: [])
  end

  def update_prefecture_ids_params
      # やはりupdate時は.requireを付けないと内容が更新されない
      params.require(:check).permit(:user_id, prefecture_ids: [])
  end

  # def checks_count_must_be_one
  #   @user = current_user
  #   if @user.checks.count >= MAX_CHECKS_COUNT
  #     flash[:danger] = 'You cannot make the check more than one.'    
  #     render 'homes/index'
  #   end
  #   # errors.add(:base, "checks count limit: #{MAX_CHECKS_COUNT}") if user.checks.count >= MAX_CHECKS_COUNT
  # end

end
