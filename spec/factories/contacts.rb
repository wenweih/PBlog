FactoryGirl.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    message {"this is contact message"}
  end
end
