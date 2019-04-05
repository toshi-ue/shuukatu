def dispTime
  Time.current.strftime("%H:%M:%S")
end

puts "start seed items. [#{dispTime}]"

items = []
item_count = 0
subgenre_count = 0

# categorys
3.times do |e|
  # puts "  start creating category-#{(e + 1).to_s}'s data"
  # subcategory
  5.times do |f|
    subgenre_count += 1
    # rand_value = rand(7..23)
    # rand_value.times do
    5.times do
      item_count += 1
        items << Item.create!(
          itemCodeNo: "#{item_count}",
          partNumber: "ITEM-#{item_count}",
          itemName: "商品-#{(item_count).to_s}",
          description: "商品-#{item_count}のせつめいです" * 16,
          price: rand(4000..300000),
          genre_id: e + 1,
          subgenre_id: subgenre_count,
          mainImage: File.open("#{Rails.root}/db/images/#{item_count.to_s}_1.jpg"),
          image2: File.open("#{Rails.root}/db/images/#{item_count}_2.jpg"),
          image3: File.open("#{Rails.root}/db/images/#{item_count}_3.jpg"),

        )
    end
    # puts "    created subcategory-#{subcategory_count.to_s}'s data"
  end
  # puts "  created category-#{(e + 1).to_s}'s data"
end

puts "created seed items(#{item_count} items). [#{dispTime}]"
