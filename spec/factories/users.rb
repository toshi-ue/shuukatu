FactoryBot.define do
  factory :user do
      sequence(:email) {|n| "tester@example.com"}
      sequence(:password) {|n| "dottlenouveau123"}
      sequence(:password_confirmation) {|n| "dottlenouveau123"}
      sequence(:provider)
      sequence(:uid)
  end
end
