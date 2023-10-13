class PurchasesController < ApplicationController
  before_action :authenticate_user! , only: [:index, :new, :create]
  before_action :set_purchase, only: [:index, :create]



  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_delivery = PurchaseDelivery.new

    if user_signed_in? && @item.purchase != nil
      if current_user.id != @item.user_id 
      redirect_to root_path and return
      end
    end

    if user_signed_in?
      if current_user.id == @item.user_id 
        redirect_to root_path and return
      end
    end
  end
  
  def create
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      pay_item
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_delivery).permit( :purchase, :postcode, :prefecture_id, :city, :house_number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_purchase
    @item = Item.find(params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類
      )
  end
end
