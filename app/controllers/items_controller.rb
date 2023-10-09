class ItemsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create,:edit, :update, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id 
      redirect_to root_path
    end
  end
  
  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if current_user.id == @item.user_id 
    @item.destroy
    end
    redirect_to root_path
  end
  
  private

  def item_params
    params.require(:item).permit(:image,:item_name,:description,:category_id,:status_id,:shipping_fee_id,:prefecture_id,:shipping_day_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end


