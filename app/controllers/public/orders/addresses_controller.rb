class Public::Orders::AddressesController < ApplicationController
  before_action :authenticate_user!

  include AddressesToshort

  def index
    @addresses = Address.includes(:prefecture).where(user_id: current_user.id)

    @address_count = ((@addresses.length % 3) -2).abs
  end

  def new
    @address = Address.new
  end

  def create
    @addresses = current_user.addresses.where(defaultflg: true)
    @address = Address.new(address_params)

    if @addresses.blank?
      @address.defaultflg = true
      @address.save
    end

    if @address.save
      redirect_to new_order_path(address_id: @address.id), success: "住所を登録しました"
    else
      @address = Address.new(address_params)
      redirect_to public_orders_addresses_new_path, alert: "認証できませんでした。\nもう一度ご確認のうえご入力ください"
    end
  end

end
