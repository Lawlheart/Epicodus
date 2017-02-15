FactoryGirl.define do
  factory :answer do
    title "MyString"
    body "MyText"
  end
  factory :question do
    title "MyString"
    body "MyText"
    votes 0
  end
  factory :user do
    email "MyString"
    password_hash "MyString"
    password_salt "MyString"
  end
end