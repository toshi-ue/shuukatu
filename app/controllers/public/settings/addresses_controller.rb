class Public::Settings::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.includes(:prefecture).where(user_id: current_user.id)


    # Viewのレイアウト調節用
    # if ((@addresses.count % 3) == 0 || @addresses.count == 2)
    @address_count = ((@addresses.length % 3) -2).abs
      # @address_count = 0
    # else
      # @address_count = ((@addresses.count % 3) -2).abs
      # @address_count = 0
    # end
  end

  def show
  end

  def new
    # @public_settings_address = Public::Settings::Address.new
    @address = Address.new

    @submit = '登録する'
  end

  def create

    @address = Address.new(address_params)
    # binding.pry

    if @address.save
      redirect_to settings_addresses_path, success: "住所を登録しました"
    else
      render 'new'
    end
  end

  def edit
    @submit = "更新"
  end

  def update

    if @address.update(address_params)
      # binding.pry
      redirect_to settings_addresses_path, success: "住所を変更しました"
    else
      render 'edit'
    end
  end

  def destroy
    @address.destroy
    redirect_to settings_addresses_path, success: "住所を削除しました"
  end

  private
  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:user_id, :user_name, :name_kana, :tel, :postalcode, :prefecture_id, :city, :street, :others)
  end
end
