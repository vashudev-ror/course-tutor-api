FactoryBot.define do
  factory :tutor do
    first_name { "John" }
    last_name  { "Doe" }
    email      { Faker::Internet.unique.email }
    association :course
  end
end
