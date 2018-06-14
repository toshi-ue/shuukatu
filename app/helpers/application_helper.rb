module ApplicationHelper

  # 円表示用
  def dispMoney(money)
    price = money.to_s
    if price.end_with?('.0')
      price = price.to_i
      "#{number_to_currency(price, :format => "%u%n", :precision => 0, :unit =>"¥")}"
    else
      "#{number_to_currency(item.price, :format => "%u%n", :precision => 1, :unit =>"¥")}"
    end
  end
end
