module AddressesToshort
  extend ActiveSupport::Concern

  def change_main_address
    @address.update_columns(defaultflg: true)
    @addresses = Address.where(user_id: current_user.id).where.not(id: params[:id])
    # binding.pry
    @addresses.each do |address|
      address.defaultflg = false
      address.save
    end
    redirect_to settings_addresses_path, success: "既定の住所を変更しました"
  end

  def get_order_address
    if session[:order]['address_id'].blank?
      if current_user.addresses.find_by(defaultflg: true).present?
        @order.address_id = current_user.addresses.find_by(defaultflg: true).id
      else
        @order.address_id = current_user.addresses.last.id
      end
    else
      @order.address_id = session[:order]['address_id']
    end
  end

  private
  def address_params
    params.require(:address).permit(:user_id, :user_name, :name_kana, :tel, :postalcode, :prefecture_id, :city, :street, :others, :defaultflg)
  end
end
