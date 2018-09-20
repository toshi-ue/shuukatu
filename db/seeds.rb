# Position(googlemap位置情報)テーブルのデータ
# Position.create(title: '東京', description: '就職希望エリア', address: '東京', latitude: 35.681241, longitude: 139.767041)
# Position.create(title: 'HAL名古屋', description: '勉強場所', address: '名古屋市中村区 名駅4丁目27−1', latitude: 35.168266, longitude: 136.885762)
# Position.create(title: '岐阜市', description: '出身地', address: '岐阜県岐阜市', latitude: 35.409570, longitude: 136.757041)
# Position.create(title: '名古屋市', description: '現住所', address: '愛知県中村区名駅南', latitude: 35.171152, longitude: 136.881558)


# 配達業者テーブルのデータ
# Dvendor.create(name: 'ヤマト', for_api_name: 'yamato', created_at: nil, updated_at: nil)
# Dvendor.create(name: '西濃運輸', for_api_name: 'seino', created_at: nil, updated_at: nil)
# Dvendor.create(name: '佐川急便', for_api_name: 'sagawa', created_at: nil, updated_at: nil)
# Dvendor.create(name: 'ゆうパック', for_api_name: 'jppost_pack', created_at: nil, updated_at: nil)
# Dvendor.create(name: '郵便書留', for_api_name: 'jppost_mail', created_at: nil, updated_at: nil)
# Dvendor.create(name: '福山通運', for_api_name: 'fukutsu', created_at: nil, updated_at: nil)



# 商品テーブルのデータ
75.times do |num|
  genre_id = rand(1..3)
  subgenre_id_range = (genre_id * 5 - 4)..(genre_id * 5)
  item = Item.create(
      itemCodeNo: num+1,
      partNumber: "ITEM-#{num+1}",
      itemName:"商品-#{num+1}",
      genre_id: genre_id,
      subgenre_id: rand(subgenre_id_range),
      price: rand(1..100000),
      description: "商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。商品-#{num+1}のせつめいです。",
      attention: nil,
      mainImage: File.open("#{Rails.root}/db/fixtures/#{num+1}_1.jpg"),
      image2: File.open("#{Rails.root}/db/fixtures/#{num+1}_2.jpg"),
      image3: File.open("#{Rails.root}/db/fixtures/#{num+1}_3.jpg"),
      created_at: (Time.local(2018, 4, 1, 0, 0, 0) + (num * 60)),
      updated_at: nil

  )
  # binding.pry
  item.save!
end




# ジャンルテーブルのデータ
3.times do |num|
  Genre.create(name: "ジャンル#{num + 1}")
end

# サブジャンルテーブルのデータ
Subgenre.create(name: 'サブジャンル1', genre_id: 1)
Subgenre.create(name: 'サブジャンル2', genre_id: 1)
Subgenre.create(name: 'サブジャンル3', genre_id: 1)
Subgenre.create(name: 'サブジャンル4', genre_id: 1)
Subgenre.create(name: 'サブジャンル5', genre_id: 1)
Subgenre.create(name: 'サブジャンル6', genre_id: 2)
Subgenre.create(name: 'サブジャンル7', genre_id: 2)
Subgenre.create(name: 'サブジャンル8', genre_id: 2)
Subgenre.create(name: 'サブジャンル9', genre_id: 2)
Subgenre.create(name: 'サブジャンル10', genre_id: 2)
Subgenre.create(name: 'サブジャンル11', genre_id: 3)
Subgenre.create(name: 'サブジャンル12', genre_id: 3)
Subgenre.create(name: 'サブジャンル13', genre_id: 3)
Subgenre.create(name: 'サブジャンル14', genre_id: 3)
Subgenre.create(name: 'サブジャンル15', genre_id: 3)

# 都道府県テーブルのデータ
Prefecture.create(name: "北海道")
Prefecture.create(name: "青森県")
Prefecture.create(name: "岩手県")
Prefecture.create(name: "宮城県")
Prefecture.create(name: "秋田県")
Prefecture.create(name: "山形県")
Prefecture.create(name: "福島県")
Prefecture.create(name: "茨城県")
Prefecture.create(name: "栃木県")
Prefecture.create(name: "群馬県")
Prefecture.create(name: "埼玉県")
Prefecture.create(name: "千葉県")
Prefecture.create(name: "東京都")
Prefecture.create(name: "神奈川県")
Prefecture.create(name: "新潟県")
Prefecture.create(name: "富山県")
Prefecture.create(name: "石川県")
Prefecture.create(name: "福井県")
Prefecture.create(name: "山梨県")
Prefecture.create(name: "長野県")
Prefecture.create(name: "岐阜県")
Prefecture.create(name: "静岡県")
Prefecture.create(name: "愛知県")
Prefecture.create(name: "三重県")
Prefecture.create(name: "滋賀県")
Prefecture.create(name: "京都府")
Prefecture.create(name: "大阪府")
Prefecture.create(name: "兵庫県")
Prefecture.create(name: "奈良県")
Prefecture.create(name: "和歌山県")
Prefecture.create(name: "鳥取県")
Prefecture.create(name: "島根県")
Prefecture.create(name: "岡山県")
Prefecture.create(name: "広島県")
Prefecture.create(name: "山口県")
Prefecture.create(name: "徳島県")
Prefecture.create(name: "香川県")
Prefecture.create(name: "愛媛県")
Prefecture.create(name: "高知県")
Prefecture.create(name: "福島県")
Prefecture.create(name: "佐賀県")
Prefecture.create(name: "長崎県")
Prefecture.create(name: "熊本県")
Prefecture.create(name: "大分県")
Prefecture.create(name: "宮崎県")
Prefecture.create(name: "鹿児島県")
Prefecture.create(name: "沖縄県")


# User.create(
#     email: '1@gmail.com',
#     password: 'asdfghjk'
# )

Manager.create(
  email: '2@gmail.com',
  password: 'asdfghjk'
)

# Address.create(
#     user_id: 1,
#     user_name: 'ユーザー1',
#     name_kana: 'ゆーざー１',
#     tel: '000-0000-0001',
#     postalcode: 0000001,
#     prefecture_id: 1,
#     city: 'サンプル市',
#     street: 'サンプル町',
#     others: 'サンプルビル1'
# )
