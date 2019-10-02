class Public::Settings::AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :edit, :update, :destroy, :change_main_address]

  include AddressesToshort

  def index
    @addresses = Address.includes(:prefecture).where(user_id: current_user.id)
    @address_count = ((@addresses.length % 3) -2).abs
    # render json:@addresses
  end

  def show
  end

  def new
    # @public_settings_address = Public::Settings::Address.new
    @address = Address.new
  end

  def create
    @addresses = current_user.addresses.where(defaultflg: true)
    @address = Address.new(address_params)
    if @addresses.blank?
      @address.defaultflg = true
    end
    if @address.save
      redirect_to settings_addresses_path, success: "住所を登録しました"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to settings_addresses_path, success: "住所を変更しました"
    else
      render 'edit'
    end
  end

  def destroy
    if @address.defaultflg == true
      @nextDefaultaddress = Address.where(user_id: current_user.id).where.not(id: @address.id).first
      unless @nextDefaultaddress.blank?
        @nextDefaultaddress.defaultflg = true
        @nextDefaultaddress.save
      end
      # binding.pry
    end
    @address.destroy
    redirect_to settings_addresses_path, success: "住所を削除しました"
  end

  private
  def set_address
    @address = Address.find(params[:id])
  end

end
