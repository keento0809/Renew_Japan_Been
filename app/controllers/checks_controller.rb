class ChecksController < ApplicationController
  def index
  
  end
  
  def create
    @check = Check.new(
        check_id: @prefecture.id,
        prefecture_name: @prefecture.name)
  end

end
