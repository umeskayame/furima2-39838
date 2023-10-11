class PurchasesController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new
     
  end


  def new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery = PurchaseDelivery.new(purchase_params)
    if @purchase_delivery.valid?
      @purchase_delivery.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  
  def purchase_params
    params.require(:purchase_delivery).permit( :purchase, :postcode, :prefecture_id, :city, :house_number, :building, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
