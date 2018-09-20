class Managers::UsersController < ApplicationController
  before_action :authenticate_manager!

  def index
    @users = User.includes(:addresses).reverse_order
  end

  def show
    @user = User.includes(:addresses).find(params[:id])
    @orders = Order.includes(:cartitems).where(user_id: params[:id]).page(params[:page]).per(40).reverse_order
  end
end
