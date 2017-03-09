FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com" }
    password '123456'
  end
  factory :food do
    name "Pizza"
    amount "1 slice"
    calories 285
    protein 12
    fat 10
    carbs 36
    date Time.now
  end
end
