FactoryBot.define do
  factory :review do
    sequence(:score) { [*1..5].sample }
    sequence(:comment) {|n| "現在の文字数: #{n.to_s.length + 25}(文字数は最低20、最高100文字)"}
    # comment { "コメント" }
    association :user
    association :item
  end
end

# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  comment    :string(255)
#  score      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer
#  user_id    :integer
#
