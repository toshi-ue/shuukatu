class Managers::OrdersController < ApplicationController
  before_action :authenticate_manager!

  def index
    @orders = Order.includes(:cartitems).page(params[:page]).per(40).reverse_order
  end
end
