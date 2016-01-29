FactoryGirl.define do
  factory :task do
    name 'MyString'
    description 'MyString'
    state 'new'
    user nil

    trait :started do
      state 'started'
    end
  end
end
