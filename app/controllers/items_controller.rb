class ItemsController < ApplicationController

  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :shopping_charge_id, :prefectures_id, :day_to_ship_id, :price).merge(user_id: current_user.id)
  end

end