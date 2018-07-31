class Public::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_key
  before_action :set_cartitems, only:[:new, :create]

  # controllers/concerns/order_toshort.rb
  include OrderToshort

  def index
    @orders = Order.includes(:cartitems).where(user_id: current_user.id).page(params[:page]).reverse_order
  end

  def show
  end

  def new
    # binding.pry
    session[:order] ||= {}
    session[:order]['address_id'] = params[:address_id] if params[:address_id].present?
    session[:order]['card_token'] = params[:card_token] if params[:card_token].present?

    set_customer
    check_existing_address_and_card

    @order = Order.new
    @order.address_id = session[:order]['address_id'] || current_user.addresses.find_by(defaultflg: true).id
    @order.card_token = session[:order]['card_token'] || @customer.default_card
    @order.credit_id = @credit.id

    @card = @customer.cards.retrieve(@order.card_token)

    set_cartitems
    # render json: @card
  end

  def create
    @order = Order.new(order_params)
    @order.set_order_no
    @order.pay_by_credit
    @order.save
    change_cartitems_order_id
    flash.now[:success] = "ご注文ありがとうございました。注文内容は以下の通りです"

  rescue Payjp::CardError
    flash.now[:danger] = "エラーが発生しました"
    render 'new'
    binding.pry
  end


  private
  def set_api_key
    Payjp.api_key = ENV['payjp_test_private_key']
  end

  def order_params
    params.require(:order).permit(:order_no, :address_id, :user_id, :total_price, :credit_id, :card_token)
  end


end
