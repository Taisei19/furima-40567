class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
   
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, alert: "商品の出品に失敗しました。"
    end
  end

  private

  def item_params
    params.require(:items).permit(:image).merge(user_id: current_user.id)
  end

end
