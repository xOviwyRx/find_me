FactoryBot.define do
  factory :setting do
    association :settable, factory: :brand
    key { "theme" }
    value { "dark" }
  end
end
