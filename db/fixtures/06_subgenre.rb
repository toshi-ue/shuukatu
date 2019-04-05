def dispTime
  Time.current.strftime("%H:%M:%S")
end

puts "start seed subgenres. [#{dispTime}]"

genre_count = 0
subgenre_count = 0

3.times do |a|
  genre_count += 1
  5.times do |b|
    subgenre_count += 1
    Subgenre.create!(
      name: "サブジャンル#{subgenre_count.to_s}",
      genre_id: genre_count
    )
  end
end

# 10.times do |b|
#   subgenre_count += 1

#   5.times do |c|
#     Subgenre.create!(
#       name: "サブジャンル#{((b * 10) + (c + 1)).to_s}",
#       category_id: b + 1
#     )
#   end
#   # puts "  created category-#{(b + 1).to_s}'s subcategory data"
# end

puts "finished seed subgenres(#{subgenre_count} subgenres). [#{dispTime}]"
