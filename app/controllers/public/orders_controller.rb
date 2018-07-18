class Public::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cartitems

  def index
    @orders = Order.includes(:cartitem).where(user_id: current_user.id).page(params[:page]).reverse_order
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
  end

  def pay
  end

  private
  def set_cartitems
    # カートに入っている商品を全て渡す
    @cartitems = Cartitem.includes(:item).where(order_id: nil ,user_id: current_user.id)

    # カート内の数量、金額の計算
    @total_count = 0
    @total_price = 0

    @cartitems.each do |cartitem|
      @total_count += cartitem.quantity.to_i
      @total_price += ((cartitem.item.price).to_i * (cartitem.quantity)).to_i
    end
  end
end
