class RecordsController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      redirect_to root_path
    else
      
      render :index, status: :unprocessable_entity
    end
  end
 
 private

  def purchase_params
    params.require(:purchase).permit(:item_id, :user_id, :post_code, :prefecture_id, :city, :address, :building, :phone_number)
  end
end