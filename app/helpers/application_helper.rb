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


  def for_css
    controller_path.gsub(/\//, "-")
  end

  # 後でコメントアウト(development用)
  def css_development
    '#' + controller_path.gsub(/\//, "-")
  end

  def jump_path
    controller_path + '/' + action_name
  end

  def item_url_params(item)
    {genre_name: item.genre.name, subgenre_name: item.subgenre.name, item_name: item.itemName}
  end

  # デバイスのエラーメッセージ出力メソッド
  def devise_error_messages
    return "" if resource.errors.empty?
    html = ""
    # エラーメッセージ用のHTMLを生成
    messages = resource.errors.full_messages.each do |msg|
      html += <<-EOF
        <div class="error_field alert alert-danger" role="alert">
          <div class="error_msg">#{msg}</div>
        </div>
      EOF
    end
    html.html_safe
  end
end
