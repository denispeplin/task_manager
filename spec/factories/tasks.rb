FactoryGirl.define do
  factory :task do
    sequence(:name) { |n| "#{Faker::Company.buzzword} #{n}" }
    sequence(:description) { |n| "#{Faker::Company.catch_phrase} #{n}" }

    trait :started do
      state 'started'
    end
  end
end
