FactoryGirl.define do
  factory :user do
    sequence(:email){|n| "user#{n}@factory.com" }
    password '123456'
  end
  factory :worker, class: User do
    sequence(:email){|n| "worker#{n}@factory.com" }
    password '123456'
    worker true
  end
  factory :job do
    title 'Wash Car'
    description 'Wash the car'
  end
end