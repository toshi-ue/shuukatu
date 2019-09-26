FactoryBot.define do
  factory :user, aliases: [:owner] do
    sequence(:email) {|n| "tester#{n}@example.com"}
    sequence(:password) {"password12"}
    sequence(:password_confirmation) {"password12"}
    sequence(:provider)
    sequence(:uid)
  end
end
