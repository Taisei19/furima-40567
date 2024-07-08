class RecordsController < ApplicationController

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new
  end

  def create
    token = params[:token] 
    @item = Item.find(params[:item_id])
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      pay_item(token) 
      @purchase.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :index, status: :unprocessable_entity
    end
  end
 
 private

  def purchase_params
    params.require(:purchase).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item(token) 
    item = Item.find(params[:item_id])  
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,  
      card: token,    
      currency: 'jpy'                
    )
  end

end


  


