module CartitemsToshort
  extend ActiveSupport::Concern

  def set_price_and_quantity
    # カート内の合計商品数
    @totalcount = 0

    # カート内の合計金額
    @total_price = 0
    @cartitems.each do |cartitem|
      @totalcount += cartitem.quantity
      @total_price += (cartitem.quantity * cartitem.item.price)
    end
  end
end
