class Public::CartitemsController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :setControllerSession, only: [:add_item, :update, :destroy]

  #controllers/concerns/cartitems_toshort.rb
  include CartitemsToshort

  def index
    @cartitems = Cartitem.includes(:item).where(order_id: nil, user_id: current_user.id)
    set_price_and_quantity
    # render json: @cartitems[0].item.itemName
  end

  def add_item
    @cartitem =Cartitem.new(cartitem_params)
    @checkcartitem = Cartitem.find_by(item_id: @cartitem.item_id, user_id: current_user.id, order_id: nil)

    if @checkcartitem.blank?
      @cartitem.save
      redirect_to cartitems_path, success: "#{@cartitem.item.itemName}がカートに追加されました"
    else
      @checkcartitem.update_columns(quantity: (@checkcartitem.quantity + @cartitem.quantity))
      @checkcartitem.save
      redirect_to cartitems_path, success: "#{@checkcartitem.item.itemName}がカートに追加されました"
    end
  end

  def update
    @cartitem = Cartitem.find(params[:id])
    @cartitem.update(quantity: params[:quantity])
    redirect_to cartitems_path, success: "#{@cartitem.item.itemName}の数量を変更しました"
  end

  def destroy
    @cartitem = Cartitem.find(params[:id])
    @cartitem.destroy
    redirect_to cartitems_path, success: "#{@cartitem.item.itemName}をカートから削除しました"
  end

  private
  def cartitem_params
    params.permit(:quantity, :item_id, :order_id, :user_id)
  end
end
