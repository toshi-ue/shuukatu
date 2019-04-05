# 配達業者テーブルのデータ

def dispTime
  Time.current.strftime("%H:%M:%S")
end

puts "start seed dvendors. [#{dispTime}]"

Dvendor.create(name: 'ヤマト', for_api_name: 'yamato', created_at: nil, updated_at: nil)
Dvendor.create(name: '西濃運輸', for_api_name: 'seino', created_at: nil, updated_at: nil)
Dvendor.create(name: '佐川急便', for_api_name: 'sagawa', created_at: nil, updated_at: nil)
Dvendor.create(name: 'ゆうパック', for_api_name: 'jppost_pack', created_at: nil, updated_at: nil)
Dvendor.create(name: '郵便書留', for_api_name: 'jppost_mail', created_at: nil, updated_at: nil)
Dvendor.create(name: '福山通運', for_api_name: 'fukutsu', created_at: nil, updated_at: nil)

puts "finished seed dvendors. [#{dispTime}]"
