FactoryBot.define do
  factory :setting do
    association :brand
    association :user
    key { "theme" }
    value { "dark" }
  end
end
