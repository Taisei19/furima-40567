class RecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :redirect_unless_item_available, only: [:index, :create]
  

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase = Purchase.new
  end

  def create
    token = params[:token] 
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
    params.require(:purchase).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
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

  def redirect_unless_item_available
    @item = Item.find(params[:item_id])
    if @item.record.present? || @item.user == current_user
      redirect_to root_path
    end
  end

end