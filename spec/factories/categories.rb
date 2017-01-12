FactoryGirl.define do
  factory :category do
    sequence(:title) { |n| "post category title_#{n}" }
  end
end
