class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  private

  def item_params
    params.require(:item).permit(:image,:item_name,:description,:category_id,:status_id,:shipping_fee_id,:prefecture_id,:shipping_day_id,:price,:user).merge(user_id: current_user.id)
  end
end
