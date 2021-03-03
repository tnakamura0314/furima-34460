class OrdersController < ApplicationController
  
  def index
    @order_order_info = OrderOrderInfo.new(order_params)
  end

  def create
    @order_order_info = OrderOrderInfo.new(order_params)
    if @order_order_info.valid?
      @order_order_info.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
