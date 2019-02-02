module CartitemsToshort
  extend ActiveSupport::Concern

  def get_cartitems
    @cartitems = Cartitem.includes(:item).where(order_id: nil ,user_id: current_user.id)

    @total_count = 0
    @total_price = 0
    @cartitems.each do |cartitem|
      @total_count += cartitem.quantity.to_i
      @total_price += ((cartitem.item.price).to_i * (cartitem.quantity)).to_i
    end
  end

  def migrate_column_values
    @cartitems.each do |cartitem|
      cartitem.order_id = @order.id
      cartitem.save
    end
  end
end
