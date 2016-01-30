FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| [n, Faker::Internet.email].join }
    password 'MyString'
  end
end
