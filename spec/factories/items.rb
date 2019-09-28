FactoryBot.define do
  factory :item do
    sequence(:itemCodeNo) {|n| n }
    sequence(:partNumber) {|n| "ITEM-#{n}" }
    sequence(:itemName) {|n| "商品-#{n}" }
    genre_id { 1 }
    subgenre_id { 1 }
    price { rand(100000..700000) }
    sequence(:description) { |n| "商品#{n}の説明です。\n" * 10 }
    attention { nil }
    mainImage {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images/sample.jpg'))}
  end
end
