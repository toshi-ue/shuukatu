genre_count = 0

def dispTime
  Time.current.strftime("%H:%M:%S")
end

puts "start seed genres. [#{dispTime}]"

3.times do |a|
  genre_count += 1
  Genre.create!(
    name: "カテゴリー#{(a + 1).to_s}"
  )
end

puts "finished seed genres(#{genre_count} genres). [#{dispTime}]"
