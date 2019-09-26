FactoryBot.define do
  factory :review do
    sequence(:score) { [*1..5].sample }
    sequence(:comment) {|n| "現在の文字数: #{n.to_s.length + 25}(文字数は最低20、最高100文字)"}
    # comment { "コメント" }
    association :user
    association :item
  end
end
