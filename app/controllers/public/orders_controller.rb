class Public::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_api_key
  before_action :get_cartitems, only:[:new, :create]

  # controllers/concerns/order_toshort.rb
  include CartitemsToshort
  include CreditsToshort
  include AddressesToshort

  def index
    @orders = Order.includes(:address, :cartitems).where(user_id: current_user.id).page(params[:page]).reverse_order
  end

  def show
  end

  def new
    session[:order] ||= {}
    session[:order]['address_id'] = params[:address_id] if params[:address_id].present?
    session[:order]['card_token'] = params[:card_token] if params[:card_token].present?

    # check_existing_address_and_card
    redirect_to(public_orders_addresses_new_path) and return if current_user.addresses.blank?
    redirect_to public_orders_credits_new_path and return if current_user.credit.blank?
    get_payjp_customer

    puts "\n\n\n0\n\n\n\n"
    @order = Order.new
    get_order_address
    get_card_token
    @card = @payjp_customer.cards.retrieve(@card_token)
    get_cartitems
    # render json: @card
    # render json: @payjp_customer
  end

  def create
    @order = Order.new(order_params)
    @order.set_order_no
    @order.pay_by_credit
    @order.save
    migrate_column_values
    session.delete(:order)

    OrderMailer.send_when_create(@order).deliver
    flash.now[:success] = "ご注文ありがとうございました。注文内容は以下の通りです"

  rescue Payjp::CardError
    flash.now[:danger] = "決済処理でエラーが発生しました"
    render 'new'
    # binding.pry
  end


  private
  def set_api_key
    Payjp.api_key = ENV['payjp_test_private_key']
  end

  def order_params
    params.require(:order).permit(:order_no, :address_id, :user_id, :total_price)
  end


end
