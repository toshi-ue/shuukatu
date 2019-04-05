# frozen_string_literal: true

@users = User.all
users_count = @users.count
addresses_count = 0
# binding.pry

user = 0

users_count.times do |n|
  addresses_count += 1
  user += 1
  user_digit_number = user.to_s.length
  user_tel = (("0" * (11 - user_digit_number)).to_s + "#{user}")
  # user_tel_with_higun = (("0" * (11 - user_digit_number)).to_s + "#{user}").insert(3, '-').insert(8, '-')

  # binding.pry
  # puts user_tel

  Address.create!(
    user_id: user,
    user_name: "ゆーざー#{user}",
    name_kana: "ユーザー#{user}",
    tel: user_tel,
    postalcode: "5008856",
    prefecture_id: 21,
    city: "岐阜市",
    street: "橋本町1丁目",
    defaultflg: true,
    created_at: @users[user - 1].created_at + 3 * 60
  )
end

puts "created seed address(#{addresses_count} addresses). [#{dispTime}]"
