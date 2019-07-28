module Public::OrdersHelper
  def address_padding
    "padding-left: 20px; margin-top: 4px;"
  end

  def credit_padding
    "margin-top: 10px;"
  end

  def disp_address(order)
    "〒#{order.address.postalcode} #{order.address.prefecture.name}#{order.address.city}#{order.address.street} #{order.address.others}"
  end

  def disp_address_mobile(order)
    "#{order.address.prefecture.name}#{order.address.city}#{order.address.street}#{order.address.others}".gsub(/\n/, '<br />')
  end

  def disp_subtotal(quantity, price)
    subtotal = quantity.to_i * price.to_i
    number_to_currency(subtotal, :format => "%u%n", :precision => 0, :unit =>"¥")
  end
end
