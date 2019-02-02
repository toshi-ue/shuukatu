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
    @address = Address.new(address_params)
    # binding.pry
    if @address.save
      redirect_to new_order_path(address_id: @address.id), success: "住所を登録しました"
      # binding.pry
    else
      render 'new'
    end
  end

  private
  def address_params
    params.require(:address).permit(:user_id, :user_name, :name_kana, :tel, :postalcode, :prefecture_id, :city, :street, :others, :defaultflg, :address_id)
  end
end
