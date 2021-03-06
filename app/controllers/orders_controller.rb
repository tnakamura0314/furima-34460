class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    redirect_to root_path  if @item.user_id == current_user.id
    @order_order_info = OrderOrderInfo.new
  end

  def create
    redirect_to root_path  if @item.user_id == current_user.id
    @order_order_info = OrderOrderInfo.new(order_params)
    if @order_order_info.valid?
      pay_order
      @order_order_info.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

    def order_params
      params.require(:order_order_info).permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end

    def pay_order
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

    def set_item
      @item = Item.find(params[:item_id])
    end

    def sold_out_item
      redirect_to root_path if @item.order.present?
    end
end
