module ApplicationHelper

  # 円表示用
  def dispYen(money)
    price = money.to_s
    if price.end_with?('.0')
      price = price.to_i
      "#{number_to_currency(price, :format => "%u%n", :precision => 0, :unit =>"¥")}"
    else
      "#{number_to_currency(item.price, :format => "%u%n", :precision => 1, :unit =>"¥")}"
    end
  end

  # https://qiita.com/Vit-Symty/items/55497adb17d476d36d69
  # スコープ判定
  def scope_name
    "#{(controller.class.parent.name).downcase}"
  end

  # コントローラー判定
  # def controller_name
  #   "#{controller.controller_name}"
  # end

  # アクション判定
  # def action_name
  #   "#{action_name}"
  # end

end
