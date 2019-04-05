t = Time.current
days_per_year = 365

def dispTime
  Time.current.strftime("%H:%M:%S")
end


puts "start seed users. [#{dispTime}]"


# User.create!(
#   email: "2@gmail.com",
#   password: "dfdf2323",
#   created_at: t.ago(3.years),
#   last_sign_in_at: t.ago(3.years),
#   confirmation_sent_at: t.ago(3.years),
#   confirmed_at: t.ago(3.years)
# )

total_users_count = 0
tmp_users_count = 0
amount = 0

# # year
3.times do |g|
  days_per_year.times do |h|
    random_value = rand(0..3)
    unless random_value == 0
      (random_value + rand(0..(g + 1))).times do |i|
        total_users_count += 1
        User.create!(
          email: "#{total_users_count + 1}@gmail.com",
          password: "dfdf2323",
          created_at: t.ago((3 - (g + 1)).years)- h.day,
          last_sign_in_at: t.ago((3 - (g + 1)).years)- h.day,
          confirmation_sent_at: t.ago((3 - (g + 1)).years)- h.day,
          confirmed_at: t.ago((3 - (g + 1)).years)- h.day
        )
      end
    end
  end
  if g == 0
    puts "  created user's datas of #{3 - (g + 1)} years ago(#{total_users_count} users). [#{dispTime}]"
    tmp_users_count = total_users_count
  else
    amount += tmp_users_count
    tmp_users_count = total_users_count - amount
    puts "  created user's datas of #{3 - (g + 1)} years ago(#{tmp_users_count} users). [#{dispTime}]"
  end
end

puts "finished seed users(#{total_users_count}). [#{dispTime}]"
