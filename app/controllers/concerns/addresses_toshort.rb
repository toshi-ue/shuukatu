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

  private
  def address_params
    params.require(:address).permit(:user_id, :user_name, :name_kana, :tel, :postalcode, :prefecture_id, :city, :street, :others, :defaultflg)
  end
end
