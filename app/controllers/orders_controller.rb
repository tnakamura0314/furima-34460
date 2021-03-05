class OrdersController < ApplicationController
  
  def index
    @item = Item.find(params[:item_id])
    @order_order_info = OrderOrderInfo.new
  end

  def create
    @order_order_info = OrderOrderInfo.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_order_info.valid?
      @order_order_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def order_params
      params.require(:order_order_info).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
    end
end
