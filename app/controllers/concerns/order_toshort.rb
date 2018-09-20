module OrderToshort
  extend ActiveSupport::Concern

  # newアクション
  def set_customer
    @credit = Credit.find_by(user_id: current_user.id)
    @customer_id = @credit.customer_id
    @customer = Payjp::Customer.retrieve(@customer_id)
  end

  # def check_existing_address_and_card
  #   redirect_to public_orders_credits_new_path and return if @customer.default_card.blank?
  # end

  def change_cartitems_order_id
    @cartitems.each do |cartitem|
      cartitem.order_id = @order.id
      cartitem.save
    end
  end

  def set_cartitems
    # カートに入っている商品を全て渡す
    @cartitems = Cartitem.includes(:item).where(order_id: nil ,user_id: current_user.id)
    # カート内の数量、金額の計算
    @total_count = 0
    @total_price = 0
    @cartitems.each do |cartitem|
      @total_count += cartitem.quantity.to_i
      @total_price += ((cartitem.item.price).to_i * (cartitem.quantity)).to_i
    end
  end
end
